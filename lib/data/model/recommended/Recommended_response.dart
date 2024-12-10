import 'Results.dart';

class RecommendedResponse {

  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  RecommendedResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  RecommendedResponse.fromJson(dynamic json) {
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