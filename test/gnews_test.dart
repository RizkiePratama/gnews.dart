import 'package:gnews/gnews.dart';
import 'package:test/test.dart';

void main() {
  group('GNewsScrap General Test', () {
    final service = GNewsScrap();

    setUp(() {
      // Additional setup if needed
    });

    test('getHeadlines() Test', () async {
      var headlines = await service.getHeadlines();
      expect(headlines.length, greaterThan(0), reason: 'Headlines should not be empty.');

      var firstHeadline = headlines[0];
      expect(firstHeadline?.containsKey('title'), true, reason: 'First headline should have a title.');
      expect(firstHeadline?.containsKey('publish_at'), true, reason: 'First headline should have a publish_at field.');
      expect(firstHeadline?.containsKey('article_path'), true, reason: 'First headline should have an article_path.');
      expect(firstHeadline?.containsKey('thumbnail_url'), true, reason: 'First headline should have a thumbnail_url.');

      expect(firstHeadline?['title'], isNotNull, reason: 'Title should not be null.');
      expect(firstHeadline?['publish_at'], isNotNull, reason: 'Publish date should not be null.');
      expect(firstHeadline?['article_path'], isNotNull, reason: 'Article path should not be null.');
      expect(firstHeadline?['thumbnail_url'], isNotNull, reason: 'Thumbnail URL should not be null.');
    });

    test('getNewsPost() Test', () async {
      var headlines = await service.getHeadlines();
      expect(headlines.length, greaterThan(0), reason: 'Headlines should not be empty.');

      var articlePath = headlines[0]?['article_path'];
      expect(articlePath, isNotNull, reason: 'Article path should not be null.');

      var post = await service.getNewsPost(articlePath);
      expect(post.containsKey('is_redirect'), true, reason: 'News post should have an is_redirect field.');
      expect(post.containsKey('url'), true, reason: 'News post should have a url field.');

      expect(post['is_redirect'], isA<bool>(), reason: 'is_redirect should be a boolean.');
      expect(post['url'], isA<String>(), reason: 'url should be a string.');
      expect(post['url'], isNotEmpty, reason: 'url should not be empty.');
    });
  });
}
