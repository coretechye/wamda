import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reel_item.dart';
import '../services/reels_repository.dart';
import '../services/reels_cache_service.dart';

/// Provider لإدارة حالة ومقاطع الريلز الإسلامية (Shorts / Reels)
class ReelsProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  final ReelsCacheService _cacheService = ReelsCacheService();

  static const String _prefDataSaverKey = 'reels_data_saver_mode';
  static const String _prefFavoritesKey = 'reels_favorite_ids';
  static const String _prefOfflineKey = 'reels_offline_ids';

  List<ReelItem> _allReels = [];
  ReelCategory _selectedCategory = ReelCategory.all;
  int _currentIndex = 0;

  bool _isPlaying = false;
  bool _isBuffering = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isMuted = false;
  bool _dataSaverMode = false;
  static const String minResolution = '720p HD'; // الحد الأدنى للدقة 720p HD
  String get currentResolution => minResolution;
  bool get dataSaverMode => _dataSaverMode;

  final Set<String> _favoriteIds = {};
  final Set<String> _offlineDownloadedIds = {};
  final Map<String, int> _likesCountMap = {};

  // Getters
  List<ReelItem> get allReels => _allReels;
  ReelCategory get selectedCategory => _selectedCategory;
  int get currentIndex => _currentIndex;
  bool get isPlaying => _isPlaying;
  bool get isBuffering => _isBuffering;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  bool get isMuted => _isMuted;

  /// القائمة المعروضة حالياً حسب الفئة المحددة
  List<ReelItem> get filteredReels {
    if (_selectedCategory == ReelCategory.all) {
      return _allReels;
    }
    return _allReels.where((r) => r.category == _selectedCategory).toList();
  }

  ReelItem? get currentReel {
    final list = filteredReels;
    if (_currentIndex >= 0 && _currentIndex < list.length) {
      return list[_currentIndex];
    }
    return null;
  }

  bool isFavorite(String reelId) => _favoriteIds.contains(reelId);
  bool isDownloaded(String reelId) => _offlineDownloadedIds.contains(reelId);

  int getLikesCount(String reelId) {
    if (_likesCountMap.containsKey(reelId)) {
      return _likesCountMap[reelId]!;
    }
    final item = _allReels.firstWhere((r) => r.id == reelId, orElse: () => _allReels.first);
    return item.initialLikesCount;
  }

  ReelsProvider() {
    _init();
  }

  /// تهيئة المزود وإعدادات الكاش والمشغل
  Future<void> _init() async {
    _allReels = ReelsRepository.getInitialReels();
    for (var r in _allReels) {
      _likesCountMap[r.id] = r.initialLikesCount;
    }

    // إعدادات التكرار كشورتس/ريلز
    await _player.setLoopMode(LoopMode.one);

    // متابعة حالة المشغل
    _player.playerStateStream.listen((state) {
      _isPlaying = state.playing;
      _isBuffering = state.processingState == ProcessingState.buffering ||
          state.processingState == ProcessingState.loading;
      notifyListeners();
    });

    _player.positionStream.listen((pos) {
      _currentPosition = pos;
      notifyListeners();
    });

    _player.durationStream.listen((dur) {
      if (dur != null) {
        _totalDuration = dur;
        notifyListeners();
      }
    });

    // استرجاع الإعدادات المحفوظة
    await _loadPreferences();
    notifyListeners();
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _dataSaverMode = prefs.getBool(_prefDataSaverKey) ?? true;

      final favList = prefs.getStringList(_prefFavoritesKey) ?? [];
      _favoriteIds.addAll(favList);

      final offList = prefs.getStringList(_prefOfflineKey) ?? [];
      _offlineDownloadedIds.addAll(offList);
    } catch (e) {
      debugPrint('خطأ في تحميل تفضيلات الريلز: $e');
    }
  }

  /// تبديل وضع توفير البيانات
  Future<void> toggleDataSaverMode() async {
    _dataSaverMode = !_dataSaverMode;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefDataSaverKey, _dataSaverMode);
    } catch (e) {
      debugPrint('خطأ في حفظ وضع توفير البيانات: $e');
    }
  }

  /// تغيير الفئة المعروضة
  void setCategory(ReelCategory category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _currentIndex = 0;
    notifyListeners();

    // تشغيل أول مقطع في الفئة الجديدة
    if (filteredReels.isNotEmpty) {
      playReelAtIndex(0);
    } else {
      _player.stop();
    }
  }

  /// الانتقال إلى مقطع وتشغيله
  Future<void> playReelAtIndex(int index) async {
    final list = filteredReels;
    if (index < 0 || index >= list.length) return;

    _currentIndex = index;
    final reel = list[index];

    try {
      _isBuffering = true;
      notifyListeners();

      // 1. أولاً نبحث إذا كان المقطع مخزناً محلياً كملف Asset داخل التطبيق (صفر نت وأوفلاين بالكامل)
      if (reel.assetPath != null) {
        debugPrint('📦 تشغيل المقطع محلياً من ملفات ومضات (أوفلاين بالكامل): ${reel.assetPath}');
        await _player.setAsset(reel.assetPath!);
      } else {
        // 2. ثانياً نبحث إذا كان المقطع مخزناً في الكاش
        final localPath = await _cacheService.getCachedAudioPath(reel.id);
        if (localPath != null) {
          debugPrint('⚡ تشغيل المقطع محلياً من الكاش: $localPath');
          await _player.setFilePath(localPath);
        } else {
          // 3. إذا لم يكن مخزناً، التشغيل بجودة 720p HD كحد أدنى دائماً
          final targetUrl = reel.audioUrl;

          debugPrint('🌐 تشغيل المقطع بجودة 720p HD: $targetUrl');
          await _player.setUrl(targetUrl);

          // تحميله في الخلفية للكاش لاستخدامه لاحقاً دون سحب باقة
          _cacheService.downloadToCache(reel.id, targetUrl);
        }
      }

      await _player.play();

      // تحميل مسبق ذكي لأول ثوانٍ من المقطع التالي (Smart Next Preload)
      _preloadNextReel(index + 1);
    } catch (e) {
      debugPrint('خطأ في تشغيل المقطع: $e');
    } finally {
      _isBuffering = false;
      notifyListeners();
    }
  }

  /// تحميل مسبق للمقطع التالي بجودة 720p HD
  void _preloadNextReel(int nextIndex) {
    final list = filteredReels;
    if (nextIndex >= 0 && nextIndex < list.length) {
      final nextReel = list[nextIndex];
      _cacheService.downloadToCache(nextReel.id, nextReel.audioUrl);
    }
  }

  /// تبديل التشغيل / الإيقاف المؤقت
  Future<void> togglePlayPause() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }
    notifyListeners();
  }

  /// إيقاف مؤقت (عند الانتقال لشاشة أخرى)
  Future<void> pause() async {
    if (_player.playing) {
      await _player.pause();
      notifyListeners();
    }
  }

  /// استئناف
  Future<void> resume() async {
    if (!_player.playing && currentReel != null) {
      await _player.play();
      notifyListeners();
    }
  }

  /// تبديل كتم الصوت
  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
    await _player.setVolume(_isMuted ? 0.0 : 1.0);
    notifyListeners();
  }

  /// التقديم والتأخير عند السحب على الشريط
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  /// تبديل الإعجاب
  void toggleLike(String reelId) {
    final currentLikes = getLikesCount(reelId);
    if (_favoriteIds.contains(reelId)) {
      _favoriteIds.remove(reelId);
      _likesCountMap[reelId] = currentLikes > 0 ? currentLikes - 1 : 0;
    } else {
      _favoriteIds.add(reelId);
      _likesCountMap[reelId] = currentLikes + 1;
    }
    _saveFavorites();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_prefFavoritesKey, _favoriteIds.toList());
    } catch (e) {
      debugPrint('خطأ في حفظ المفضلة: $e');
    }
  }

  /// تنزيل المقطع للاستخدام بدون إنترنت
  Future<bool> downloadReelForOffline(ReelItem reel) async {
    final path = await _cacheService.downloadForOffline(reel.id, reel.audioUrl);
    if (path != null) {
      _offlineDownloadedIds.add(reel.id);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_prefOfflineKey, _offlineDownloadedIds.toList());
      notifyListeners();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }
}
