import 'Dates.dart';
import 'Results.dart';

class ReleasesResponse {
  String?statusCode;
  String?statusMessage;
  String?success;
  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  ReleasesResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
      this.dates, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  ReleasesResponse.fromJson(dynamic json)
  {
    success=json["success"];
    statusCode=json["status_code"];
    statusMessage=json["status_message"];
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