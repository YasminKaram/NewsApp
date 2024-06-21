 import 'package:news_app/Models/NewsResponse.dart';
import 'package:news_app/Models/SourceResponse.dart';

abstract class HomeRepo{
  Future<SourceResponse>getSources(String catId);
  Future<NewsResponse>getNews(String txt,String sourceId);

}