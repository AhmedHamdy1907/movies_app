import 'Results.dart';

class RecommendedResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  RecommendedResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  RecommendedResponse.fromJson(dynamic json) {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }

  }



}