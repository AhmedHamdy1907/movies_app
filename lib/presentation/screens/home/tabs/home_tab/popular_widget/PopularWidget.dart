import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/home_tap/popular_provider/provider_data.dart';
import 'build_PopularItem.dart';
import 'build_carouselSlider.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularProvider(),
      child: Consumer<PopularProvider>(
        builder: (context, value, child) {
          if (value.popularResponse!.results == null ||
              value.popularResponse!.results!.isEmpty) {
            value.data();
            return const Center(
                child:
                    CircularProgressIndicator()); // نعرض شاشة تحميل حتى يتم تحميل البيانات
          }
          return SizedBox(
            height: 289.h,
            width: double.infinity,
            child: Stack(
              children: [
                BuildCarouselSlider(
                  resultsPopular: value.popularResponse?.results,
                  changeIndex: value.changeindex,
                ),
                BuildPopularitem(resultsPopular:value.popularResponse?.results ,index: value.index,),
              ],
            ),
          );
        },
      ),
    );
  }
}
