import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/reels_provider.dart';
import '../widgets/reels/reel_player_card.dart';
import '../widgets/reels/reels_top_bar.dart';

/// الشاشة الرئيسية للومضات المرئية والقصيرة (Shorts / Reels Screen)
class ReelsScreen extends StatefulWidget {
  final int initialIndex;

  const ReelsScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> with WidgetsBindingObserver {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _pageController = PageController(initialPage: widget.initialIndex);

    // بدء تشغيل المقطع الأول بعد بناء الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ReelsProvider>();
      provider.playReelAtIndex(widget.initialIndex);
    });

    // ضبط شفافية شريط الحالة
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final provider = context.read<ReelsProvider>();
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      provider.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // إيقاف الصوت عند مغادرة شاشة الريلز
    context.read<ReelsProvider>().pause();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReelsProvider>();
    final reels = provider.filteredReels;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. عارض المقاطع بالسحب الرأسي (Vertical Swiping)
          if (reels.isEmpty)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: Color(0xFFD4AF37),
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'لا توجد ومضات في هذا التصنيف حالياً',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () => provider.setCategory(provider.selectedCategory),
                    icon: const Icon(Icons.refresh, color: Color(0xFFD4AF37)),
                    label: const Text(
                      'عرض جميع الومضات',
                      style: TextStyle(color: Color(0xFFD4AF37)),
                    ),
                  ),
                ],
              ),
            )
          else
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: reels.length,
              onPageChanged: (index) {
                provider.playReelAtIndex(index);
              },
              itemBuilder: (context, index) {
                final reel = reels[index];
                return ReelPlayerCard(
                  reel: reel,
                  isActive: provider.currentIndex == index,
                );
              },
            ),

          // 2. الشريط العلوي الثابت
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ReelsTopBar(
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
