import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/popular_movies/Popular_response.dart';
// https://api.themoviedb.org/3/movie/popular
class ApiManager {

  // Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
 static const  String  _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTE0MjFkMGQ0OWE1OTJjZWE1MmViN2VhMmYwZTdhMCIsIm5iZiI6MTczMzU0MTQ4My40MjQsInN1YiI6IjY3NTNiZTZiODcxYTQyYzljMjQ1NGZjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MFdufgo_1oF-01p3-sNs9UBbMyJtD_8lw_wdIQsFzCk";
 static const String _accept ="application/json";

 static const String _baseUrl="hapi.themoviedb.org";

 static const String _popularEndPoint="/3/movie/top_rated?";

 static const String _language="en-US";
 static const int _page=1;
 static Future<PopularResponse> getPopular()async
  {
    // Uri url  = Uri.https(_baseUrl,_popularEndPoint,
    //     {
    //       "language":_language,
    //       "page":1
    //
    // });
    http.Response serverResponse =await http.get(  Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")

  ,headers:
    {
      'Authorization': 'Bearer $_authorization',
      "accept":_accept
    });

var json =jsonDecode(serverResponse.body); //بتاخد استرينج وبترجع جيسون
    PopularResponse response=PopularResponse.fromJson(json);
    return response;
  }
}






// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// Future<void> fetchMovieDetails(int movieId) async {
//    final String apiUrl = 'https://api.themoviedb.org/3/movie/$movieId';
//  final String bearerToken = 'YOUR_BEARER_TOKEN_HERE'; // Replace with your actual bearer token
//
//    try {
//    final response = await http.get(
//    Uri.parse(apiUrl),
//   headers: {
//    'Authorization': 'Bearer $bearerToken',
//  'Content-Type': 'application/json',
//    },
//    );
//
//   if (response.statusCode == 200) {
//   // Parse the JSON response
//    final Map<String, dynamic> movieDetails = json.decode(response.body);
//    print('Movie Details: $movieDetails');
//   } else {
//    print('Failed to fetch movie details. Status code: ${response.statusCode}');
//    print('Response body: ${response.body}');
//   }
//   } catch (error) {
//    print('Error occurred while fetching movie details: $error');
//    }
// }
//
// void main() {
//    fetchMovieDetails(550); // Example movie ID
// }
//




