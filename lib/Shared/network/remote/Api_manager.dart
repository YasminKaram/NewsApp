
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Models/NewsResponse.dart';
import 'package:news_app/Models/SourceResponse.dart';
import 'package:news_app/Shared/Components/constant.dart';

class ApiManager{


   static Future<SourceResponse> getSources(String category)async{
    Uri url=Uri.https(Base_Url,"/v2/top-headlines/sources",
    {
      "apiKey":Api_Key,
      "category":category
    });

    Response response= await http.get(url);

    var jsonData=jsonDecode(response.body);
    SourceResponse data=SourceResponse.fromJson(jsonData);
    return data;

  }

  static Future<NewsResponse> getNews(String sourceId,String txt)async{
     Uri url=Uri.https(Base_Url,"/v2/everything",
         {
           "apiKey":Api_Key,
           "Sources":sourceId,
           "q":txt,


         });
     http.Response response= await http.get(url);
     var jsonData=jsonDecode(response.body);
     NewsResponse data=NewsResponse.fromJson(jsonData);
     return data;
  }

}