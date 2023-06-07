import 'package:gnews/src/parser/parser.dart';

class Aljazeera extends Parser {
    Aljazeera(String url) : super(url) {
        querySelectorValue = 'main#main-content-area';
    }

    Future<Map<String, dynamic>?> generateResponse(var content) async {
        return {
            'is_redirect': false,
            'url': url,
            'source': 'Al-Jazeera',
            'title': content.querySelector('.article-header h1').text,
            'subtitle': content.querySelector('.article__subhead em').text,
            'author': content.querySelector('.article-author-name-item').text,
            'content': content.querySelector('.wysiwyg').innerHtml
        };
    }
}