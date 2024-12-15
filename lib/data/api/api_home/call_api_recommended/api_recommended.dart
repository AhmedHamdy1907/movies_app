import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/home_Tap_Model/recommended/Recommended_response.dart';
class ApiRecommended {

  // Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
  static const  String  _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODQ4MjI4ZjQ1YTU4NmYyN2I2YmE5MjBmZDc5MWI2ZCIsIm5iZiI6MTczMzE0MDUxNS42MDMwMDAyLCJzdWIiOiI2NzRkYTAyMzdjMWQ2OThiN2RmN2Y2ZDYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.MA4D3UVIKOo6emEZPN6CyfmmYc_inw9QFim3Gc9hZ70";
  static const String _accept ="application/json";
  static const String _baseUrl="api.themoviedb.org";
  static const String _popularEndPoint="/3/movie/top_rated?";
  static const String _language="en-US";
  static const int _page=1;

  static Future<RecommendedResponse> getRecommended()async
  {
    // Uri url  = Uri.https(_baseUrl,_popularEndPoint,
    //     {
    //       "language":_language,
    //       "page":1
    // }
    // );
    http.Response serverResponse =await http.get(  Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
        ,headers:
        {
          'Authorization': 'Bearer $_authorization',
          "accept":_accept
        }
    );
    var json =jsonDecode(serverResponse.body); //بتاخد استرينج وبترجع جيسون

    RecommendedResponse response=RecommendedResponse.fromJson(json);
    return response;
  }
}

