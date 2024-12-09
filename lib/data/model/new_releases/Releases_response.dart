import 'Dates.dart';
import 'Results.dart';

class ReleasesResponse {
  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  ReleasesResponse({
      this.dates, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  ReleasesResponse.fromJson(dynamic json)
  {
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

}