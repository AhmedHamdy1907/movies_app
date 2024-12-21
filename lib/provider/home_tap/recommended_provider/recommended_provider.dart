import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import '../../../data/api/api_home/call_api_recommended/api_recommended.dart';
import '../../../data/model/homeScreen_model/home_Tap_Model/recommended/Recommended_response.dart';

class RecommendedProvider extends ChangeNotifier
{
 RecommendedResponse recommendedResponse =RecommendedResponse();

 Future<RecommendedResponse>data ()async
 {
   try {
     final cheak =await ApiRecommended.getRecommended();
     ;
     if (cheak.statusCode == "200" || cheak.success !="false")
     {
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

 void getRecommended ()async
 {
  recommendedResponse =await data();
  notifyListeners();
 }
}