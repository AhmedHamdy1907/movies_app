import 'dart:convert';
import '../../model/homeScreen_model/browser_Tap_Model/BrowserResponse.dart';
import 'package:http/http.dart' as http;

class getbrowser {
  static const String _authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODQ4MjI4ZjQ1YTU4NmYyN2I2YmE5MjBmZDc5MWI2ZCIsIm5iZiI6MTczMzE0MDUxNS42MDMwMDAyLCJzdWIiOiI2NzRkYTAyMzdjMWQ2OThiN2RmN2Y2ZDYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.MA4D3UVIKOo6emEZPN6CyfmmYc_inw9QFim3Gc9hZ70";
  static const String _accept = "application/json";
  static const String _baseUrl = "api.themoviedb.org";
  static const String _EndPoint = "/3/genre/movie/list";

  static Future<BrowserResponse> getBrowser() async {
    Uri uri = Uri.https(_baseUrl, _EndPoint, {
      "language": "en",
    });

    http.Response response = await http.get(uri, headers: {
      'Authorization': 'Bearer $_authorization',
      "accept": _accept,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      BrowserResponse browserResponse = BrowserResponse.fromJson(json);
      return browserResponse;
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
