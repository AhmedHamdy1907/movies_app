
import '../../details_screen_Model/details_film/Genres.dart';

class BrowserResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  List<GenresBrowser>? genresBrowser;
  BrowserResponse(
      {
        this.success,
        this.statusCode,
        this.statusMessage,
        this.genresBrowser,
  });

  BrowserResponse.fromJson(dynamic json) {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
    if (json['genres'] != null) {
      genresBrowser = [];
      json['genres'].forEach((v) {
        genresBrowser?.add(GenresBrowser.fromJson(v));
      });
    }
  }


}