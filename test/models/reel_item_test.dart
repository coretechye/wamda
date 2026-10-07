import 'package:flutter_test/flutter_test.dart';
import 'package:wamda/models/reel_item.dart';
import 'package:wamda/services/reels_repository.dart';

void main() {
  group('ReelItem Tests', () {
    test('ReelsRepository returns valid non-empty list of initial reels', () {
      final reels = ReelsRepository.getInitialReels();
      expect(reels.isNotEmpty, true);
      expect(reels.length, greaterThanOrEqualTo(5));

      final first = reels.first;
      expect(first.id, isNotEmpty);
      expect(first.title, isNotEmpty);
      expect(first.audioUrl, isNotEmpty);
      expect(first.assetPath, isNotNull);
      expect(first.durationSeconds, greaterThan(0));
      expect(first.fileSizeBytes, greaterThan(0));

      // التأكد من أن جميع الومضات لها مسار محلي مدمج وفيديو 720p HD MP4
      for (final r in reels) {
        expect(r.assetPath, isNotNull);
        expect(r.assetPath!.startsWith('assets/wamadat/'), true);
        expect(r.videoPath, isNotNull);
        expect(r.videoPath!.endsWith('.mp4'), true);
        expect(r.resolution, '720p HD');
      }
    });

    test('ReelItem formattedSize calculates properly', () {
      const smallReel = ReelItem(
        id: '1',
        title: 'test',
        contentSnippet: 'test',
        category: ReelCategory.quran,
        authorName: 'test',
        audioUrl: 'https://example.com/audio.mp3',
        durationSeconds: 20,
        fileSizeBytes: 512 * 1024, // 512 KB
      );
      expect(smallReel.formattedSize, '512 ك.ب');

      const largeReel = ReelItem(
        id: '2',
        title: 'test',
        contentSnippet: 'test',
        category: ReelCategory.quran,
        authorName: 'test',
        audioUrl: 'https://example.com/audio.mp3',
        durationSeconds: 60,
        fileSizeBytes: 2 * 1024 * 1024, // 2 MB
      );
      expect(largeReel.formattedSize, '2.0 م.ب');
    });

    test('ReelItem toJson and fromJson serialization works correctly', () {
      final reel = ReelsRepository.getInitialReels().first;
      final json = reel.toJson();
      final fromJson = ReelItem.fromJson(json);

      expect(fromJson.id, reel.id);
      expect(fromJson.title, reel.title);
      expect(fromJson.contentSnippet, reel.contentSnippet);
      expect(fromJson.category, reel.category);
      expect(fromJson.authorName, reel.authorName);
      expect(fromJson.resolution, '720p HD');
    });
  });
}
