<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Simple Google News Scraper
This is just a simple http and html package wraper for scraping https://news.google.com/

# How To Install
TBA!

# Example Usage
```dart
import 'package:gnews/gnews.dart';

void main() async {
  var service = GNewsScrap();
  var headlines = await service.getHeadlines();

  if(headlines != null) {
    headlines.forEach((headline){
      print(headline?['title']);
      print(headline?['article_path']);
      print(headline?['thumbnail_url']);
      print(headline?['publish_at'] + '\n');
    });
  }
}
```
