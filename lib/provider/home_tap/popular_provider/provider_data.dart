
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import '../../../data/api/api_home/call_api_popular/api_manager.dart';
import '../../../data/model/homeScreen_model/home_Tap_Model/popular_movies/Popular_response.dart';

class PopularProvider extends ChangeNotifier
{
  int index=0;
  void changeindex(newindex)
  {
    if(index==newindex)return;
    index=newindex;
    notifyListeners();
  }
  PopularResponse? popularResponse=PopularResponse();
 void data() async {
    try {
      final cheak = await ApiManager.getPopular();
      if (cheak.statusCode == "200" || cheak.success !="false")
      {
        popularResponse = await ApiManager.getPopular() ;
        notifyListeners();

      }
      else {
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
 // void getDataPopular() async
 // {
 //   if (_isDisposed) return;
 //   popularResponse = await data();
 //   if (!_isDisposed)
 //   {
 //     notifyListeners();
 //   }
 // }
 // @override
 //  void dispose() {
 //   _isDisposed = true;
 //   super.dispose();
 //  }
}

