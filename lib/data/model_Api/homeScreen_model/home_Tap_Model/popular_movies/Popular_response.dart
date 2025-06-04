import 'Results.dart';
class PopularResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  num? page;
  num? totalPages;
  num? totalResults;
  List<ResultsPopular>? results;

  PopularResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,});

  PopularResponse.fromJson(dynamic json) {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsPopular.fromJson(v));
      });
    }

  }


}