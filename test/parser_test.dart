import 'package:gnews/gnews.dart';
import 'package:gnews/parser.dart';
import 'package:test/test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Parser>()])
import 'parser_test.mocks.dart';

void main() {
  group('Site Extension Parser', () {
    var google_url = 'https://google.com/';

    test('getResponse() Return Null if don\'t have querySelectoreValue', () async {
      var parser = new Parser(google_url);
      var response = await parser.getResponse();

      expect(response, isNull);
    });

    test('getResponse() Return Null if querySelectoreValue filled but no generateResponse implementation', () async {
      var parser = new MockParser();
      when(parser.url).thenReturn(google_url);
      when(parser.querySelectorValue).thenReturn('div#SIvCob');

      var response = await parser.getResponse();

      expect(parser.querySelectorValue, 'div#SIvCob');
      verifyNever(parser.generateResponse(any)); // Never Called because un-implemented
      expect(response, isNull);
    });
  });
}
