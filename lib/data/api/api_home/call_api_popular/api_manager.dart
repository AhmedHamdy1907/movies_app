import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/popular_movies/Popular_response.dart';
class ApiManager {

  // Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
 static const  String  _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTE0MjFkMGQ0OWE1OTJjZWE1MmViN2VhMmYwZTdhMCIsIm5iZiI6MTczMzU0MTQ4My40MjQsInN1YiI6IjY3NTNiZTZiODcxYTQyYzljMjQ1NGZjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MFdufgo_1oF-01p3-sNs9UBbMyJtD_8lw_wdIQsFzCk";
 static const String _accept ="application/json";
 static const String _baseUrl="api.themoviedb.org";
 static const String _popularEndPoint="/3/movie/top_rated?";
 static const String _language="en-US";
 static const int _page=1;

 static Future<PopularResponse> getPopular()async
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

    PopularResponse response=PopularResponse.fromJson(json);
    return response;
  }
}







