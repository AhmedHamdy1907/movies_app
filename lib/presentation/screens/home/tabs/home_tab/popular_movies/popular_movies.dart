import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/popular_movies/widget/popular_widget.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: 217.h,
              child: Image.asset(
                'assets/images/Image.png',
                width: double.infinity,
              ),
            ),
            Container(
              margin: REdgeInsets.only(left: 164, top: 14),
              height: 72.h,
              width: double.infinity,
              color: ColorsManager.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dora and the lost city of gold',
                    style: AppStyle.movieTitle,
                  ),
                  SizedBox(height: 10.h,),
                  Text('2019  PG-13  2h 7m', style: AppStyle.movieDate,),
                ],
              ),
            ),
          ],
        ),
        const PopularWidget(),
      ]),
    );
  }
}
