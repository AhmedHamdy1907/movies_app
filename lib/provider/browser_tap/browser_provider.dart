import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/api/api_browser/api_browser.dart';
import '../../data/model/homeScreen_model/browser_Tap_Model/BrowserResponse.dart';

class browserProvider extends ChangeNotifier
{
  BrowserResponse browserResponse  =BrowserResponse();
  Future<void>getBrowser ()async
  {
    try
    {
      BrowserResponse check = await getbrowser.getBrowser();
      if (check.statusCode == "200" || check.success != "false") {
        browserResponse = check;
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