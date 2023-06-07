import 'package:gnews/gnews.dart';

Future<Map<String, dynamic>?> exampleHeadline() async {
  var service = GNewsScrap();
  var headlines = await service.getHeadlines();
  var headline = headlines[0];

  print("getHeadlines()\n---------------------");
  if(headline != null) {
    for (MapEntry entry in headline.entries) {
      print(entry.key.toString() +': ' + entry.value.toString());
    }
    print('\n');
  };

  return headline;
}

void exampleGetPost(String path) async {
  var service = GNewsScrap();
  var post = await service.getNewsPost(path);

  print("getNewsPost()\n---------------------");
  if (post != null) {
    for (MapEntry entry in post.entries) {
      print(entry.key.toString() +': ' + entry.value.toString());
    }
    print('\n');
  }
}

void main() async {
  var sample = await exampleHeadline();
  exampleGetPost(sample?['article_path']);
}
