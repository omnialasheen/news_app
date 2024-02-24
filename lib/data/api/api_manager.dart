import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/source_response.dart';

abstract class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static const String apiKey = "e2c65ebf18034746a97c8fead1379970";

  static Future<List<Source>> getSource(String category) async{
    Uri url = Uri.parse("https://$baseUrl$sourceEndPoint?apiKey=$apiKey&category=$category");
    Response serverResponse =await get(url);
    Map json = jsonDecode(serverResponse.body);
    print(json);
    sourcesResponseDM sourcesResponse =sourcesResponseDM.fromJson(json);
    if(serverResponse.statusCode >= 200 && serverResponse.statusCode <300 &&
      sourcesResponse.sources!.isNotEmpty == true){
        return sourcesResponse.sources!;
    }
    print("---------");
    throw Exception(sourcesResponse.message);  
  }

  static Future<List<Article>> getArtical(String sourceId) async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      "apiKey" : apiKey,
      "sources" : sourceId
    });
    Response serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if(serverResponse.statusCode >= 200 && serverResponse.statusCode <300 &&
      articlesResponse.articles?.isNotEmpty == true){
        return articlesResponse.articles!;
    }
    throw Exception("something want wrong  please try again later");

  }
} 