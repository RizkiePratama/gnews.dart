import 'dart:core';
import 'dart:async';

import 'package:gnews/src/parser/parser.dart';
import 'package:gnews/src/parser/aljazeera.dart';

class ParserAdapter {
    static List<String> _supportedNewsSite = [
        "aljazeera.com"
    ];

    static Parser? getParserFor(String url) {
        if (isSupported(url)) {
            var uri = Uri.parse(url);
            var host_name = uri.host.replaceAll("www.", "");

            switch (host_name) {
                case 'aljazeera.com':
                    return new Aljazeera(url);
            }
        }

        return null;
    }

    static bool isSupported(String url) {
        for (String supported in _supportedNewsSite) {
            if(url.contains(supported)) {
                return true;
            }
        }

        return false;
    }
}