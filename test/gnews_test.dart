import 'package:gnews/gnews.dart';
import 'package:test/test.dart';

void main() {
  group('GNews Scraper General Test', () {
    final service = GNewsScrap();

    setUp(() {
      // Additional setup goes here.
    });

    test('getHeadlines() Test', () async {
      var headlines = await service.getHeadlines();

      expect(headlines.length, greaterThan(0));
      expect(headlines[0]?.containsKey('title'), true);
      expect(headlines[0]?.containsKey('publish_at'), true);
      expect(headlines[0]?.containsKey('article_path'), true);
    });

    test('geNewsPost() Test', () async {
      var headlines = await service.getHeadlines();
      var post = await service.getNewsPost(headlines[0]?['article_path']);

      expect(post?.containsKey('is_redirect'), true);
      expect(post?.containsKey('url'), true);
    });
  });
}
