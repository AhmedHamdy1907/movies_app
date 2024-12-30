import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/homeScreen_model/browser_Tap_Model/resulte_data/ResultBrowserResponse.dart';
// https://api.themoviedb.org/3/discover/movie?with_genres=28
class GetBrowserResult
{
  static const String _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODQ4MjI4ZjQ1YTU4NmYyN2I2YmE5MjBmZDc5MWI2ZCIsIm5iZiI6MTczMzE0MDUxNS42MDMwMDAyLCJzdWIiOiI2NzRkYTAyMzdjMWQ2OThiN2RmN2Y2ZDYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.MA4D3UVIKOo6emEZPN6CyfmmYc_inw9QFim3Gc9hZ70";
  static const String _accept = "application/json";
  static const String _baseUrl = "api.themoviedb.org"; // فقط اسم السيرفر بدون https
  static const String _endPoint = "/3/discover/movie"; // نقطه النهاية (endpoint)
 static Future<ResultBrowserResponse>getResultBrowser ({required num? id})async
 {
  Uri uri=Uri.http(_baseUrl,_endPoint,
  {
    "with_genres":"$id"
  }
  );
  http.Response response= await http.get(uri,headers:
   {
     'Authorization': 'Bearer $_authorization',
     "accept": _accept,
   });

  var json =jsonDecode(response.body);
  ResultBrowserResponse resultBrowserResponse =ResultBrowserResponse.fromJson(json);
  return resultBrowserResponse;
 }



}