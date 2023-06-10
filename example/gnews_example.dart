import 'package:gnews/gnews.dart';

Future<void> exampleRun() async {
  var service = GNewsScrap();
  var headlines = await service.getHeadlines();

  await Future.forEach(headlines, (headline) async {
    if(headline != null) {
      for (MapEntry entry in headline.entries) {
        print(entry.key.toString() +': ' + entry.value.toString());
      }
      print('\n');

      var post = await service.getNewsPost(headline['article_path']);
      if(post != null) {
        for (MapEntry entry in post.entries) {
          print(entry.key.toString() +': ' + entry.value.toString());
        }
        print('\n');
        print('-------------------------------------');
      }
    };

  });
}

void main() async {
  exampleRun();
}
