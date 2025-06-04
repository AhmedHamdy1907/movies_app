import 'Results.dart';

class ResultBrowserResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  num? page;
  List<ResultsBrowser>? results;
  num? totalPages;
  num? totalResults;
  ResultBrowserResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  ResultBrowserResponse.fromJson(dynamic json) {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsBrowser.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }



}