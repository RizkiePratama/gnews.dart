import 'dart:core';
import 'dart:async';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';


class Parser {
    String url;
    String? _querySelectorValue;
    String? get querySelectorValue => _querySelectorValue;

    set querySelectorValue(String? value) {
        _querySelectorValue = value;
    }

    Parser(this.url);

    Future<Document> _getWebPage() async {
        var response = await Client().get(Uri.parse(this.url));
        return parse(response.body);
    }
    
    Future<Map<String, dynamic>?> getResponse() async {
        var page = await _getWebPage();
        
        if (querySelectorValue != null) {
            var content = page.querySelectorAll(querySelectorValue!);
            print(content);
            return generateResponse(content[0]);
        }

        return null;
    }

    Future<Map<String, dynamic>?> generateResponse(var content) async {}
}