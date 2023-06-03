import 'package:gnews/gnews.dart';

void main() async {
  var service = GNewsScrap();
  var headlines = await service.getHeadlines();

  if(headlines != null) {
    headlines.forEach((t){
      print(t?['title']);
      print(t?['article_path']);
      print(t?['thumbnail_url']);
      print(t?['publish_at'] + '\n');
    });
  }
}
