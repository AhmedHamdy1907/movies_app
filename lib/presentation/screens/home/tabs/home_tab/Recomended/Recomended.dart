import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'RecomendedItem.dart';

class Recommended extends StatelessWidget {
  Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    // Static mock data for recommended movies
    final mockRecommended = [
      {'id': 1, 'title': 'Avengers: Endgame', 'poster_path': '/or06FN3Dka5tukK1e9sl16pB3iy.jpg'},
      {'id': 2, 'title': 'Joker', 'poster_path': '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg'},
      {'id': 3, 'title': 'Parasite', 'poster_path': '/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg'},
      {'id': 4, 'title': '1917', 'poster_path': '/iZf0KyrE25z1sage4SYFLCCrMi9.jpg'},
      {'id': 5, 'title': 'Once Upon a Time in Hollywood', 'poster_path': '/8j58ZEBf5UNLV40H4Wu5czq9Qpz.jpg'},
    ];

    return Padding(
      padding: REdgeInsets.only(top: 10.h),
      child: Container(
        color: ColorsManager.black2,
        height: 250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(left: 18.w, top: 10.h, bottom: 12.h),
              child: Text("Recommended", style: AppStyle.newReleaseTitle),
            ),
            SizedBox(
              height: 190.h,
              child: ListView.builder(
                padding: REdgeInsets.only(left: 18.w),
                scrollDirection: Axis.horizontal,
                itemCount: mockRecommended.length,
                itemBuilder: (context, index) => Padding(
                  padding: REdgeInsets.only(right: 13.w),
                  child: RecommendedItem(
                    index: index,
                    mockData: mockRecommended,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
