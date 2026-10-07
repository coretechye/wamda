import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// خدمة إدارة التخزين المؤقت وحفظ البيانات للمقاطع القصيرة (Reels Cache & Data Saver)
/// تضمن تشغيل المقاطع بدون استهلاك مكرر للإنترنت وحفظها للاستخدام الأوفلاين
class ReelsCacheService {
  static final ReelsCacheService _instance = ReelsCacheService._internal();
  factory ReelsCacheService() => _instance;
  ReelsCacheService._internal();

  static const String _cacheFolder = 'reels_cache';
  static const String _offlineFolder = 'reels_offline';

  /// فحص نوع الاتصال بالشبكة (واي فاي أم بيانات شريحة)
  Future<bool> isConnectedToWifi() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult == ConnectivityResult.wifi;
    } catch (e) {
      debugPrint('خطأ في فحص نوع الاتصال: $e');
      return false;
    }
  }

  /// هل الاتصال عبر بيانات الهاتف المحمول (لتفعيل وضع التوفير تلقائياً إن لزم)
  Future<bool> isMobileData() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult == ConnectivityResult.mobile;
    } catch (e) {
      return false;
    }
  }

  /// مجلد الكاش للمقاطع المؤقتة
  Future<Directory> _getCacheDirectory() async {
    final tempDir = await getTemporaryDirectory();
    final cacheDir = Directory('${tempDir.path}/$_cacheFolder');
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    return cacheDir;
  }

  /// مجلد التنزيلات الدائمة للأوفلاين
  Future<Directory> _getOfflineDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final offlineDir = Directory('${appDir.path}/$_offlineFolder');
    if (!await offlineDir.exists()) {
      await offlineDir.create(recursive: true);
    }
    return offlineDir;
  }

  /// التحقق مما إذا كان المقطع مخزناً مسبقاً في الذاكرة المحلية
  Future<String?> getCachedAudioPath(String reelId) async {
    try {
      // 1. أولاً نفحص في مجلد التنزيلات الدائمة للأوفلاين
      final offlineDir = await _getOfflineDirectory();
      final offlineFile = File('${offlineDir.path}/$reelId.mp3');
      if (await offlineFile.exists()) {
        return offlineFile.path;
      }

      // 2. ثانياً نفحص في مجلد الكاش المؤقت
      final cacheDir = await _getCacheDirectory();
      final cachedFile = File('${cacheDir.path}/$reelId.mp3');
      if (await cachedFile.exists()) {
        return cachedFile.path;
      }
    } catch (e) {
      debugPrint('خطأ في التحقق من كاش المقطع $reelId: $e');
    }
    return null;
  }

  /// تحميل وتخزين المقطع مؤقتاً في الكاش
  Future<String?> downloadToCache(String reelId, String url) async {
    try {
      final existingPath = await getCachedAudioPath(reelId);
      if (existingPath != null) return existingPath;

      final cacheDir = await _getCacheDirectory();
      final targetFile = File('${cacheDir.path}/$reelId.mp3');

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await targetFile.writeAsBytes(response.bodyBytes);
        return targetFile.path;
      }
    } catch (e) {
      debugPrint('تعذر تحميل كاش المقطع $reelId: $e');
    }
    return null;
  }

  /// تنزيل المقطع بشكل دائم للمشاهدة بدون إنترنت
  Future<String?> downloadForOffline(String reelId, String url) async {
    try {
      final offlineDir = await _getOfflineDirectory();
      final targetFile = File('${offlineDir.path}/$reelId.mp3');

      // إذا كان موجوداً مسبقاً في الكاش، ننسخه مباشرة بدون استهلاك إنترنت جديد!
      final cacheDir = await _getCacheDirectory();
      final cachedFile = File('${cacheDir.path}/$reelId.mp3');
      if (await cachedFile.exists()) {
        await cachedFile.copy(targetFile.path);
        return targetFile.path;
      }

      // وإلا نقوم بتحميله
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await targetFile.writeAsBytes(response.bodyBytes);
        return targetFile.path;
      }
    } catch (e) {
      debugPrint('فشل تنزيل المقطع أوفلاين $reelId: $e');
    }
    return null;
  }

  /// حذف مقطع من التنزيلات
  Future<bool> deleteOfflineReel(String reelId) async {
    try {
      final offlineDir = await _getOfflineDirectory();
      final file = File('${offlineDir.path}/$reelId.mp3');
      if (await file.exists()) {
        await file.delete();
        return true;
      }
    } catch (e) {
      debugPrint('خطأ في حذف المقطع $reelId: $e');
    }
    return false;
  }

  /// التحقق هل المقطع منزل أوفلاين
  Future<bool> isDownloadedOffline(String reelId) async {
    final offlineDir = await _getOfflineDirectory();
    final file = File('${offlineDir.path}/$reelId.mp3');
    return file.exists();
  }

  /// حساب حجم الكاش المستهلك حالياً (بالبايت)
  Future<int> getCacheSizeBytes() async {
    try {
      int totalSize = 0;
      final cacheDir = await _getCacheDirectory();
      if (await cacheDir.exists()) {
        final files = cacheDir.listSync(recursive: true);
        for (var file in files) {
          if (file is File) {
            totalSize += await file.length();
          }
        }
      }
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  /// مسح الكاش المؤقت لتفريغ المساحة
  Future<void> clearCache() async {
    try {
      final cacheDir = await _getCacheDirectory();
      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
      }
    } catch (e) {
      debugPrint('خطأ في مسح الكاش: $e');
    }
  }
}
