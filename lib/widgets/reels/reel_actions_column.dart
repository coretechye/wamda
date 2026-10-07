import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/reel_item.dart';
import '../../providers/reels_provider.dart';

/// عمود الإجراءات والتفاعل الجانبي للمقطع (تيكتوك / شورتس ستايل)
class ReelActionsColumn extends StatefulWidget {
  final ReelItem reel;

  const ReelActionsColumn({
    super.key,
    required this.reel,
  });

  @override
  State<ReelActionsColumn> createState() => _ReelActionsColumnState();
}

class _ReelActionsColumnState extends State<ReelActionsColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _likeAnimController;
  late Animation<double> _likeScaleAnim;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _likeAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _likeScaleAnim = Tween<double>(begin: 1.0, end: 1.35).animate(
      CurvedAnimation(parent: _likeAnimController, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _likeAnimController.dispose();
    super.dispose();
  }

  void _onLikeTap(ReelsProvider provider) {
    provider.toggleLike(widget.reel.id);
    _likeAnimController.forward().then((_) => _likeAnimController.reverse());
  }

  Future<void> _onShareTap() async {
    final text = '✨ ${widget.reel.title}\n\n'
        '${widget.reel.contentSnippet}\n\n'
        '🎙️ بصوت: ${widget.reel.authorName}\n'
        '${widget.reel.surahName != null ? '📖 ${widget.reel.surahName} (الآية ${widget.reel.ayahNumber})\n' : ''}'
        '\nعبر تطبيق ومضة — آية تضيء يومك';

    await Share.share(text);
  }

  Future<void> _onDownloadTap(ReelsProvider provider) async {
    if (provider.isDownloaded(widget.reel.id) || _isDownloading) return;

    setState(() => _isDownloading = true);
    final success = await provider.downloadReelForOffline(widget.reel);
    setState(() => _isDownloading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? 'تم حفظ المقطع للاستماع بدون إنترنت ✅' : 'فشل التنزيل، تحقق من الاتصال',
            style: const TextStyle(fontFamily: 'Cairo'),
          ),
          backgroundColor: success ? Colors.green.shade800 : Colors.red.shade800,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReelsProvider>();
    final isLiked = provider.isFavorite(widget.reel.id);
    final likesCount = provider.getLikesCount(widget.reel.id);
    final isDownloaded = provider.isDownloaded(widget.reel.id);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. زر الإعجاب مع حركة تكبير
        ScaleTransition(
          scale: _likeScaleAnim,
          child: _buildActionButton(
            icon: isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: isLiked ? Colors.redAccent : Colors.white,
            label: '$likesCount',
            onTap: () => _onLikeTap(provider),
          ),
        ),
        const SizedBox(height: 16),

        // 2. زر المشاركة
        _buildActionButton(
          icon: Icons.share_rounded,
          color: Colors.white,
          label: 'مشاركة',
          onTap: _onShareTap,
        ),
        const SizedBox(height: 16),

        // 3. زر التنزيل للأوفلاين
        _buildActionButton(
          icon: isDownloaded
              ? Icons.check_circle_rounded
              : (_isDownloading
                  ? Icons.downloading_rounded
                  : Icons.cloud_download_outlined),
          color: isDownloaded ? Colors.greenAccent : Colors.white,
          label: isDownloaded ? 'محفوظ' : widget.reel.formattedSize,
          onTap: () => _onDownloadTap(provider),
        ),
        const SizedBox(height: 16),

        // 4. زر كتم / تشغيل الصوت
        _buildActionButton(
          icon: provider.isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
          color: Colors.white.withOpacity(0.9),
          label: provider.isMuted ? 'صامت' : 'صوت',
          onTap: () => provider.toggleMute(),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.35),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
