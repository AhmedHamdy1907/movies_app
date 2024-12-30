import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/api/api_RuseltBrowser/api_ResultBrowser.dart';
import '../../data/model/homeScreen_model/browser_Tap_Model/resulte_data/ResultBrowserResponse.dart';

class ResultBrowserProvider extends ChangeNotifier
{
  ResultBrowserResponse resultBrowserResponse =ResultBrowserResponse();
  Future<void>getResultBrowser ({required num?id})async
  {
    try
    {
      ResultBrowserResponse check = await GetBrowserResult.getResultBrowser(id: id);
      if (check.statusCode == "200" || check.success != "false") {
        resultBrowserResponse = check;
        notifyListeners();
      }
      else {
        throw Exception('Error: Failed to fetch data from the server');
      }
    }
    catch (e) {
      if (e is SocketException) {
        throw Exception('No internet connection');
      } else if (e is TimeoutException) {
        throw Exception('Request timed out');
      } else {
        throw Exception('An unknown error occurred');
      }
    }











  }


}