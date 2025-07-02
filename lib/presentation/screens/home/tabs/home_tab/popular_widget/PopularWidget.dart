import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../data/model_Api/homeScreen_model/home_Tap_Model/popular_movies/Results.dart';
import 'build_PopularItem.dart';
import 'build_carouselSlider.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Static mock data
    final mockResults = [
      ResultsPopular(
        id: 1,
        title: 'The Dark Knight',
        posterPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
        backdropPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
        overview: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
        voteAverage: 9.0,
        releaseDate: '2008-07-18',
        originalTitle: 'The Dark Knight',
      ),
      ResultsPopular(
        id: 2,
        title: 'Inception',
        posterPath: '/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
        backdropPath: '/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
        overview: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
        voteAverage: 8.8,
        releaseDate: '2010-07-16',
        originalTitle: 'Inception',
      ),
      ResultsPopular(
        id: 3,
        title: 'Interstellar',
        posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        backdropPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        overview: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
        voteAverage: 8.6,
        releaseDate: '2014-11-07',
        originalTitle: 'Interstellar',
      ),
    ];

    return SizedBox(
      height: 289.h,
      width: double.infinity,
      child: Stack(
        children: [
          BuildCarouselSlider(
            resultsPopular: mockResults,
            changeIndex: (index) {}, // Static function
          ),
          BuildPopularitem(
            resultsPopular: mockResults,
            index: 0, // Always show first item
          ),
        ],
      ),
    );
  }
}
