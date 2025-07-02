import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../data/model_Api/homeScreen_model/home_Tap_Model/popular_movies/Results.dart';

typedef ChangeIndex = void Function(int newIndex);

class BuildCarouselSlider extends StatelessWidget {
  List<ResultsPopular>? resultsPopular;
  ChangeIndex changeIndex;
  
  BuildCarouselSlider({super.key, required this.resultsPopular, required this.changeIndex});
  
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    
    return CarouselSlider(
      options: CarouselOptions(
        pauseAutoPlayOnTouch: true,
        autoPlay: true,
        height: 217.h,
        viewportFraction: 1,
        // Removed onPageChanged to make it static
      ),
      items: resultsPopular?.map((e) {
        return SizedBox(
          height: 217.h,
          width: double.infinity,
          child: resultsPopular != null
              ? Image.network(
                  '$pathImageUrl${e.backdropPath!}',
                  fit: BoxFit.fill,
                )
              : const Center(
                  child: CircularProgressIndicator()
                )
        );
      }).toList(),
    );
  }
}
