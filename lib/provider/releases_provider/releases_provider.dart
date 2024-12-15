import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../data/api/api_home/call_api_releases/api_releases.dart';
import '../../data/model/new_releases/Releases_response.dart';
class providerReleases extends ChangeNotifier
{
  bool _isDisposed = false;
  int index=2;
  void changeindex(newindex)
  {
    if(index==newindex)return;
    index=newindex;
    notifyListeners();
  }
  ReleasesResponse releasesResponse=ReleasesResponse();
  Future<ReleasesResponse> data() async {
    try {
      final cheak =await ApiManagerReleases.getReleases();
      ;
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
  void getDataReleases() async
  {

    releasesResponse = await data();
      notifyListeners();


    // @override
    // void dispose() {
    //   _isDisposed = true;
    //   super.dispose();
    // }
  }
}