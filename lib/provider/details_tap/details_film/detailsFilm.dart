import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_details/details_film_api/details_film_api.dart';

import '../../../data/model/details_screen_Model/details_film/DetailsResponse.dart';
class detailsFilmProvider extends ChangeNotifier {
   num? id;
  DetailsResponse detailsResponse = DetailsResponse();
  void data(num? id) async {
    try {
      final cheak = await getDetailsFilm.getdetailsFilm(id: id);
      if (cheak.statusCode == "200" || cheak.success != "false") {
        detailsResponse = await getDetailsFilm.getdetailsFilm(id: id);
        notifyListeners();
      } else {
        throw Exception('Error: Failed to fetch data from the server');
      }
    }




    catch (e) {
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
  // void getdetailsFilme() async {
  //   detailsResponse = await data();
  //       notifyListeners();
  //
  // }
}
