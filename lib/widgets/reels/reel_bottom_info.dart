import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/reel_item.dart';
import '../../providers/reels_provider.dart';
import '../../screens/verse_details_screen.dart';
import '../../providers/verse_provider.dart';

/// تفاصيل المقطع السفلية مع شريط التقدم الدقيق
class ReelBottomInfo extends StatefulWidget {
  final ReelItem reel;

  const ReelBottomInfo({
    super.key,
    required this.reel,
  });

  @override
  State<ReelBottomInfo> createState() => _ReelBottomInfoState();
}

class _ReelBottomInfoState extends State<ReelBottomInfo> {
  bool _isExpanded = false;

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _navigateToVerse(BuildContext context) {
    if (widget.reel.surahNumber == null || widget.reel.ayahNumber == null) return;

    final verseProvider = context.read<VerseProvider>();
    final verses = verseProvider.allVerses;
    final match = verses.where((v) =>
        v.surahNumber == widget.reel.surahNumber &&
        v.verseNumber == widget.reel.ayahNumber).toList();

    if (match.isNotEmpty) {
      context.read<ReelsProvider>().pause();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerseDetailsScreen(verse: match.first),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReelsProvider>();
    final position = provider.currentPosition;
    final total = provider.totalDuration;
    final progress = (total.inMilliseconds > 0)
        ? (position.inMilliseconds / total.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. تصنيف المقطع + اسم السورة/الآية
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 0.8,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.reel.category.icon,
                    size: 13,
                    color: const Color(0xFFD4AF37),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.reel.category.titleAr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.reel.surahName != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _navigateToVerse(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4AF37).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFD4AF37).withOpacity(0.5),
                      width: 0.8,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        size: 13,
                        color: Color(0xFFF0E68C),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.reel.surahName} : ${widget.reel.ayahNumber}',
                        style: const TextStyle(
                          color: Color(0xFFF0E68C),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 9,
                        color: Color(0xFFF0E68C),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFD4AF37).withOpacity(0.5),
                  width: 0.8,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.hd_rounded,
                    size: 13,
                    color: Color(0xFFD4AF37),
                  ),
                  SizedBox(width: 3),
                  Text(
                    '720p',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // 2. اسم القارئ / المتحدث مع أيقونة التحقق
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD4AF37),
              ),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xFF1B3D2B),
                child: Icon(
                  Icons.person,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.reel.authorName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black87, blurRadius: 4),
                ],
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.verified_rounded,
              color: Color(0xFFD4AF37),
              size: 16,
            ),
          ],
        ),
        const SizedBox(height: 6),

        // 3. عنوان المقطع
        Text(
          widget.reel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(color: Colors.black87, blurRadius: 4),
            ],
          ),
        ),
        const SizedBox(height: 4),

        // 4. النص مع إمكانية التوسيع "المزيد"
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.reel.contentSnippet,
                maxLines: _isExpanded ? 6 : 2,
                overflow: TextIndicatorState.ellipsis,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 13,
                  height: 1.4,
                  fontFamily: 'UthmanicHafs',
                  shadows: const [
                    Shadow(color: Colors.black87, blurRadius: 4),
                  ],
                ),
              ),
              if (widget.reel.contentSnippet.length > 50)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    _isExpanded ? 'عرض أقل' : '... المزيد',
                    style: TextStyle(
                      color: const Color(0xFFD4AF37).withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // 5. شريط التقدم السفلي الدقيق (TikTok Progress Line)
        LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onHorizontalDragUpdate: (details) {
                final localX = details.localPosition.dx.clamp(0.0, constraints.maxWidth);
                final seekPct = localX / constraints.maxWidth;
                final seekPos = Duration(
                  milliseconds: (total.inMilliseconds * seekPct).toInt(),
                );
                provider.seek(seekPos);
              },
              child: Container(
                height: 14, // منطقة لمس أوسع
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4AF37),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4AF37).withOpacity(0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // عداد الوقت
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDuration(position),
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 10,
              ),
            ),
            Text(
              _formatDuration(total),
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

typedef TextIndicatorState = TextOverflow;
