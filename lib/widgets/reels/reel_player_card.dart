import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../models/reel_item.dart';
import '../../providers/reels_provider.dart';
import 'reel_actions_column.dart';
import 'reel_bottom_info.dart';

/// بطاقة عرض المقطع القصير (720p HD Video Reel Card)
class ReelPlayerCard extends StatefulWidget {
  final ReelItem reel;
  final bool isActive;

  const ReelPlayerCard({
    super.key,
    required this.reel,
    required this.isActive,
  });

  @override
  State<ReelPlayerCard> createState() => _ReelPlayerCardState();
}

class _ReelPlayerCardState extends State<ReelPlayerCard>
    with TickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  late AnimationController _pulseController;
  late AnimationController _heartAnimController;
  late Animation<double> _heartScaleAnim;
  late Animation<double> _heartOpacityAnim;

  Offset _heartPosition = Offset.zero;
  bool _showHeart = false;
  bool _showPlayPauseIndicator = false;

  @override
  void initState() {
    super.initState();
    _initVideo();

    // تحكم في نبضات الأثر البصري
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    // تحكم في حركة القلب عند النقر المزدوج
    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _heartScaleAnim = Tween<double>(begin: 0.3, end: 1.4).animate(
      CurvedAnimation(parent: _heartAnimController, curve: Curves.elasticOut),
    );

    _heartOpacityAnim = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _heartAnimController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  Future<void> _initVideo() async {
    try {
      if (widget.reel.videoPath != null) {
        _videoController = VideoPlayerController.asset(widget.reel.videoPath!);
      } else if (widget.reel.videoUrl != null) {
        _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.reel.videoUrl!));
      }

      if (_videoController != null) {
        await _videoController!.initialize();
        await _videoController!.setLooping(true);

        if (mounted) {
          setState(() {
            _isVideoInitialized = true;
          });
          if (widget.isActive) {
            _videoController!.play();
          }
        }
      }
    } catch (e) {
      debugPrint('خطأ في تهيئة الفيديو: $e');
    }
  }

  @override
  void didUpdateWidget(ReelPlayerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _videoController?.play();
      } else {
        _videoController?.pause();
      }
    }
  }

  @override
  void dispose() {
    _videoController?.pause();
    _videoController?.dispose();
    _pulseController.dispose();
    _heartAnimController.dispose();
    super.dispose();
  }

  void _onDoubleTapDown(TapDownDetails details) {
    setState(() {
      _heartPosition = details.localPosition;
      _showHeart = true;
    });

    final provider = context.read<ReelsProvider>();
    if (!provider.isFavorite(widget.reel.id)) {
      provider.toggleLike(widget.reel.id);
    }

    _heartAnimController.forward(from: 0.0).then((_) {
      if (mounted) {
        setState(() => _showHeart = false);
      }
    });
  }

  void _onSingleTap() {
    final provider = context.read<ReelsProvider>();
    provider.togglePlayPause();

    if (_videoController != null && _isVideoInitialized) {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
    }

    setState(() => _showPlayPauseIndicator = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => _showPlayPauseIndicator = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReelsProvider>();
    final isPlaying = (_videoController?.value.isPlaying ?? provider.isPlaying) && widget.isActive;
    final isBuffering = (_videoController?.value.isBuffering ?? provider.isBuffering) && widget.isActive;

    // مزامنة كتم الصوت مع إعداد المزود
    if (_videoController != null && _isVideoInitialized) {
      _videoController!.setVolume(provider.isMuted ? 0.0 : 1.0);
    }

    return GestureDetector(
      onTap: _onSingleTap,
      onDoubleTapDown: _onDoubleTapDown,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. تشغيل الفيديو عالي الدقة 720p HD MP4
          if (_isVideoInitialized && _videoController != null)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController!.value.size.width > 0 ? _videoController!.value.size.width : 720,
                  height: _videoController!.value.size.height > 0 ? _videoController!.value.size.height : 1280,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            )
          else
            // خلفية روحانية ناعمة لحين جاهزية الفيديو
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.reel.gradientColors.isNotEmpty
                      ? [
                          widget.reel.gradientColors.first,
                          Colors.black,
                        ]
                      : [const Color(0xFF1B3D2B), Colors.black],
                ),
              ),
            ),

          // 2. طبقة تعتيم سينمائية خفيفة لتوضيح النصوص والأزرار
          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          // 3. منطقة النص القرآني / الموعظة المركزية المتناغمة
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // إطار النص القرآني الشفاف الأنيق
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.42),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: const Color(0xFFD4AF37).withOpacity(0.35),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.format_quote_rounded,
                          color: Color(0xFFD4AF37),
                          size: 26,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.reel.contentSnippet,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            height: 1.8,
                            fontFamily: 'UthmanicHafs',
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 8),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 1,
                          width: 70,
                          color: const Color(0xFFD4AF37).withOpacity(0.4),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.reel.authorName,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            shadows: const [
                              Shadow(color: Colors.black87, blurRadius: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 4. تدرج سفلي داكن لقراءة تفاصيل المقطع بوضوح
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 240,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.92),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 5. التفاصيل السفلية (اسم القارئ، العنوان، شريط التقدم، شارة 720p)
          Positioned(
            left: 16,
            right: 84, // ترك مساحة لعمود الأزرار الجانبي
            bottom: 24,
            child: ReelBottomInfo(reel: widget.reel),
          ),

          // 6. عمود الإجراءات الجانبي (إعجاب، مشاركة، تنزيل، كتم)
          Positioned(
            right: 14,
            bottom: 36,
            child: ReelActionsColumn(reel: widget.reel),
          ),

          // 7. مؤشر التخزين المؤقت (Buffering Spinner)
          if (isBuffering)
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  color: Color(0xFFD4AF37),
                  strokeWidth: 2.5,
                ),
              ),
            ),

          // 8. مؤشر التشغيل/الإيقاف عند النقر
          if (_showPlayPauseIndicator)
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showPlayPauseIndicator ? 1.0 : 0.0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.play_arrow_rounded : Icons.pause_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ),

          // 9. حركة القلب عند النقر المزدوج (Double Tap Heart)
          if (_showHeart)
            Positioned(
              left: _heartPosition.dx - 45,
              top: _heartPosition.dy - 45,
              child: FadeTransition(
                opacity: _heartOpacityAnim,
                child: ScaleTransition(
                  scale: _heartScaleAnim,
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.redAccent,
                    size: 90,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 10),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
