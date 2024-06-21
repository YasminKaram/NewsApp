import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Models/NewsResponse.dart';
import 'package:news_app/Models/SourceResponse.dart';
import 'package:news_app/Screens/home/repo/repo.dart';

import '../../../../Shared/Components/constant.dart';

class RemoteDS implements HomeRepo{
  @override
  Future<NewsResponse> getNews(String txt, String sourceId) async {
    Uri url = Uri.https(Base_Url, "/v2/everything", {
      "apiKey": Api_Key,
      "Sources": sourceId,
      "q": txt,
    });
    http.Response response = await http.get(url);

    try {
      var jsonData = jsonDecode(response.body);
      NewsResponse data = NewsResponse.fromJson(jsonData);
    return data;
    }
    catch(e){
      throw Exception();
    }
  }

  @override
  Future<SourceResponse> getSources(String catId)async {
    Uri url = Uri.https(Base_Url, "/v2/top-headlines/sources",
        {"apiKey": Api_Key, "category": catId});

    Response response = await http.get(url);

    try {
      var jsonData = jsonDecode(response.body);
      SourceResponse data = SourceResponse.fromJson(jsonData);
      return data;

    }
    catch(e){
      throw Exception();
    }

    }
  
}