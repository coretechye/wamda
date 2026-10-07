import 'package:flutter/material.dart';

/// تصنيفات الومضات المرئية والقصيرة
enum ReelCategory {
  all,
  quran, // قرآن كريم وتلاوات خاشعة
  dawah, // مواعظ وتدبر
  awareness, // توعية وأخلاق وقيم
  dua, // أدعية وأذكار
}

extension ReelCategoryExtension on ReelCategory {
  String get id {
    switch (this) {
      case ReelCategory.all:
        return 'all';
      case ReelCategory.quran:
        return 'quran';
      case ReelCategory.dawah:
        return 'dawah';
      case ReelCategory.awareness:
        return 'awareness';
      case ReelCategory.dua:
        return 'dua';
    }
  }

  String get titleAr {
    switch (this) {
      case ReelCategory.all:
        return 'الكل';
      case ReelCategory.quran:
        return 'تلاوات خاشعة';
      case ReelCategory.dawah:
        return 'مواعظ وتدبر';
      case ReelCategory.awareness:
        return 'ومضات توعوية';
      case ReelCategory.dua:
        return 'أدعية وأذكار';
    }
  }

  IconData get icon {
    switch (this) {
      case ReelCategory.all:
        return Icons.auto_awesome;
      case ReelCategory.quran:
        return Icons.menu_book_rounded;
      case ReelCategory.dawah:
        return Icons.lightbulb_outline;
      case ReelCategory.awareness:
        return Icons.volunteer_activism_outlined;
      case ReelCategory.dua:
        return Icons.favorite_outline;
    }
  }
}

/// نموذج المقطع المرئي / الصوتي القصير (Reel Item)
class ReelItem {
  final String id;
  final String title;
  final String contentSnippet;
  final ReelCategory category;
  final String authorName; // القارئ أو الداعية
  final String audioUrl;
  final String? lowQualityAudioUrl; // جودة منخفضة لترشيد البيانات
  final String? thumbnailUrl;
  final String? surahName;
  final int? surahNumber;
  final int? ayahNumber;
  final int durationSeconds;
  final int fileSizeBytes; // حجم المقطع بالبايتات لمعرفة الاستهلاك
  final int initialLikesCount;
  final String? assetPath; // مسار الملف الصوتي المحلي المدمج للتشغيل أوفلاين
  final String? videoPath; // مسار ملف الفيديو المحلي (720p HD MP4)
  final String? videoUrl; // رابط الفيديو عبر الشبكة
  final String resolution; // دقة المقطع (720p HD كحد أدنى)
  final List<String> tags;
  final List<Color> gradientColors;
  final String? tafsirOrExplanation;

  const ReelItem({
    required this.id,
    required this.title,
    required this.contentSnippet,
    required this.category,
    required this.authorName,
    required this.audioUrl,
    this.lowQualityAudioUrl,
    this.assetPath,
    this.videoPath,
    this.videoUrl,
    this.resolution = '720p HD',
    this.thumbnailUrl,
    this.surahName,
    this.surahNumber,
    this.ayahNumber,
    required this.durationSeconds,
    this.fileSizeBytes = 500000,
    this.initialLikesCount = 120,
    this.tags = const [],
    this.gradientColors = const [Color(0xFF1B3D2B), Color(0xFF0F2419)],
    this.tafsirOrExplanation,
  });

  /// تحويل الحجم إلى صيغة مقروءة (مثلاً: 650 KB)
  String get formattedSize {
    if (fileSizeBytes < 1024 * 1024) {
      final kb = (fileSizeBytes / 1024).toStringAsFixed(0);
      return '$kb ك.ب';
    }
    final mb = (fileSizeBytes / (1024 * 1024)).toStringAsFixed(1);
    return '$mb م.ب';
  }

  ReelItem copyWith({
    String? id,
    String? title,
    String? contentSnippet,
    ReelCategory? category,
    String? authorName,
    String? audioUrl,
    String? lowQualityAudioUrl,
    String? assetPath,
    String? videoPath,
    String? videoUrl,
    String? resolution,
    String? thumbnailUrl,
    String? surahName,
    int? surahNumber,
    int? ayahNumber,
    int? durationSeconds,
    int? fileSizeBytes,
    int? initialLikesCount,
    List<String>? tags,
    List<Color>? gradientColors,
    String? tafsirOrExplanation,
  }) {
    return ReelItem(
      id: id ?? this.id,
      title: title ?? this.title,
      contentSnippet: contentSnippet ?? this.contentSnippet,
      category: category ?? this.category,
      authorName: authorName ?? this.authorName,
      audioUrl: audioUrl ?? this.audioUrl,
      lowQualityAudioUrl: lowQualityAudioUrl ?? this.lowQualityAudioUrl,
      assetPath: assetPath ?? this.assetPath,
      videoPath: videoPath ?? this.videoPath,
      videoUrl: videoUrl ?? this.videoUrl,
      resolution: resolution ?? this.resolution,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      surahName: surahName ?? this.surahName,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      initialLikesCount: initialLikesCount ?? this.initialLikesCount,
      tags: tags ?? this.tags,
      gradientColors: gradientColors ?? this.gradientColors,
      tafsirOrExplanation: tafsirOrExplanation ?? this.tafsirOrExplanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'contentSnippet': contentSnippet,
      'category': category.id,
      'authorName': authorName,
      'audioUrl': audioUrl,
      'lowQualityAudioUrl': lowQualityAudioUrl,
      'assetPath': assetPath,
      'videoPath': videoPath,
      'videoUrl': videoUrl,
      'resolution': resolution,
      'thumbnailUrl': thumbnailUrl,
      'surahName': surahName,
      'surahNumber': surahNumber,
      'ayahNumber': ayahNumber,
      'durationSeconds': durationSeconds,
      'fileSizeBytes': fileSizeBytes,
      'initialLikesCount': initialLikesCount,
      'tags': tags,
      'tafsirOrExplanation': tafsirOrExplanation,
    };
  }

  factory ReelItem.fromJson(Map<String, dynamic> json) {
    ReelCategory cat = ReelCategory.all;
    final catStr = json['category'] as String?;
    if (catStr == 'quran') cat = ReelCategory.quran;
    if (catStr == 'dawah') cat = ReelCategory.dawah;
    if (catStr == 'awareness') cat = ReelCategory.awareness;
    if (catStr == 'dua') cat = ReelCategory.dua;

    return ReelItem(
      id: json['id'] as String,
      title: json['title'] as String,
      contentSnippet: json['contentSnippet'] as String,
      category: cat,
      authorName: json['authorName'] as String,
      audioUrl: json['audioUrl'] as String,
      lowQualityAudioUrl: json['lowQualityAudioUrl'] as String?,
      assetPath: json['assetPath'] as String?,
      videoPath: json['videoPath'] as String?,
      videoUrl: json['videoUrl'] as String?,
      resolution: (json['resolution'] as String?) ?? '720p HD',
      thumbnailUrl: json['thumbnailUrl'] as String?,
      surahName: json['surahName'] as String?,
      surahNumber: json['surahNumber'] as int?,
      ayahNumber: json['ayahNumber'] as int?,
      durationSeconds: (json['durationSeconds'] as int?) ?? 30,
      fileSizeBytes: (json['fileSizeBytes'] as int?) ?? 500000,
      initialLikesCount: (json['initialLikesCount'] as int?) ?? 100,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
      tafsirOrExplanation: json['tafsirOrExplanation'] as String?,
    );
  }
}
