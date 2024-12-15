import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../data/api/api_details/more_likeThis_api/moreLikeThis_api.dart';
import '../../../data/model/details_tap_Model/more_like_this/MoreLikeThisResponse.dart';

class MoreLikeThisProvider extends ChangeNotifier {
  static num? id;
  MoreLikeThisResponse moreLikeThisResponse = MoreLikeThisResponse();
  Future<MoreLikeThisResponse> data() async {
    try {
      print(":قبل ماتروح لي ال API $id");
      final cheak = await getApiMoreLikeThis.getMoreLikeThis(id: id);
      if (cheak.statusCode == "200" || cheak.success != false) {
        return cheak;
      } else {
        throw Exception('Error: Failed to fetch data from the server');
      }
    } catch (e) {
      if (e is SocketException) {
        print('No internet connection');
        throw Exception('No internet connection');
      } else if (e is TimeoutException) {
        print('Request timed out');
        throw Exception('Request timed out');
      } else {
        print('An error occurred: $e');
        throw Exception('An unknown error occurred');
      }
    }
  }
  void getMoreLikeThis() async {
      moreLikeThisResponse = await data();
      notifyListeners();
  }
}
