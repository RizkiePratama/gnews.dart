import 'package:gnews/gnews.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
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
  });
}
