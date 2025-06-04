import 'Results.dart';

class SearchResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  num? page;
  List<ResultsSearch>? results;
  num? totalPages;
  num? totalResults;

  SearchResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});
  SearchResponse.fromJson(dynamic json) {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ResultsSearch.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }



}