import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/homeScreen_model/search_tap_model/SearchRespone.dart';
class SearchApi
{
  static const  String  _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODQ4MjI4ZjQ1YTU4NmYyN2I2YmE5MjBmZDc5MWI2ZCIsIm5iZiI6MTczMzE0MDUxNS42MDMwMDAyLCJzdWIiOiI2NzRkYTAyMzdjMWQ2OThiN2RmN2Y2ZDYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.MA4D3UVIKOo6emEZPN6CyfmmYc_inw9QFim3Gc9hZ70";
  static const String _accept ="application/json";

  static Future<SearchResponse> getSearchData({required String searchSend})async
  {
    print("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss$searchSend");
    http.Response serverResponse= await http.get  (Uri.parse("https://api.themoviedb.org/3/search/movie?query=$searchSend"),
      headers: {
      'Authorization': 'Bearer $_authorization',
      "accept": _accept
      },);
    var json=jsonDecode(serverResponse.body);
    SearchResponse searchResponse =SearchResponse.fromJson(json);
    return searchResponse;
  }
}
// "https://api.themoviedb.org/3/search/movie?query=$searchSend"