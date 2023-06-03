import 'dart:core';
import 'dart:async';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';


class GNewsScrap {
  static String googleNewsURI = 'https://news.google.com';
  static String headlinesPage = "/topics/CAAqKggKIiRDQkFTRlFvSUwyMHZNRFZxYUdjU0JXVnVMVWRDR2dKSlJDZ0FQAQ?hl=en-ID&gl=ID&ceid=ID%3Aen";

  Future<List<Map<String, dynamic>?>> getHeadlines() async {
    List<Map<String, dynamic>> _fetchedNews = [];

    var news_list = await _getElementFromPage(headlinesPage, '.IBr9hb');
    news_list.forEach((news) {
      Map<String, dynamic> composed = {};

      news.nodes.forEach((node) {
        switch (node.toString()) {
          case '<html div>':
            if(node.attributes['class'] == 'XlKvRb') {
              composed['article_path'] = node.nodes[0].attributes['href']?.substring(1);
            };

            if(node.attributes['class'] == 'UOVeFe ') {
              composed['publish_at'] = node.nodes[0].attributes['datetime'];
            }
            break;

          case '<html h4>':
            composed['title'] = node.text;
            break;

          case '<html figure>':
            composed['thumbnail_url'] = node.nodes[0].attributes['src'];
            break;
        }
      });

      _fetchedNews.add(composed);
    });

    return _fetchedNews;
  }

  Future<List<Element>> _getElementFromPage(String page_path, String query) async {
    var request_url = Uri.parse(googleNewsURI + page_path);
    var response = await Client().get(request_url);

    var pageContent = parse(response.body);
    return pageContent.querySelectorAll(query);
  }
}
