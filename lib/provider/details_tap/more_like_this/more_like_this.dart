import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../data/api/api_details/more_likeThis_api/moreLikeThis_api.dart';
import '../../../data/model/details_screen_Model/more_like_this/MoreLikeThisResponse.dart';

class MoreLikeThisProvider extends ChangeNotifier {
  MoreLikeThisResponse moreLikeThisResponse = MoreLikeThisResponse();
  void data(num? id) async {
    try {
      print(":قبل ماتروح لي ال API $id");
      final cheak = await getApiMoreLikeThis.getMoreLikeThis(id: id);
      if (cheak.statusCode == "200" || cheak.success != false) {
        moreLikeThisResponse = await getApiMoreLikeThis.getMoreLikeThis(id: id);
        notifyListeners();
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
  // void getMoreLikeThis() async {
  //     moreLikeThisResponse = await data();
  //     notifyListeners();
  // }
}
