import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/api/api_search/searchApi.dart';
import '../../data/model/homeScreen_model/search_tap_model/SearchRespone.dart';

class searchProvider extends ChangeNotifier
{

  SearchResponse searchResponse = SearchResponse();
  Future<SearchResponse> data({ required String search}) async
  {
    try {
      final check =await SearchApi.getSearchData(searchSend:search);
      if (check.statusCode == "200" || check.success !="false")
      {
        return check;
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
    }  }

  void getSearchData ({required String search}) async
  {
    searchResponse= await data(search: search);
    notifyListeners();
  }
}