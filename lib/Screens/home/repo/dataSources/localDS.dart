import 'package:news_app/Models/NewsResponse.dart';
import 'package:news_app/Models/SourceResponse.dart';
import 'package:news_app/Screens/home/repo/repo.dart';

class LocalDS implements HomeRepo{
  @override
  Future<NewsResponse> getNews(String txt, String sourceId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String catId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
  
}