import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186.h,
      width: 97.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorsManager.iconColor,
          borderRadius: BorderRadius.circular(4.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(children: [
            Container(
              height: 135.h,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Image (1).png',
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: () {
                //add to watch list
              },
              child: Stack(children: [
                Icon(
                  Icons.bookmark,
                  color: ColorsManager.iconColor.withOpacity(0.87),
                  size: 40.sp,
                ),
                Positioned(
                    top: 9.h,
                    left: 10.w,
                    child: Icon(
                      Icons.add,
                      color: ColorsManager.white,
                      size: 20.sp,
                    )),
              ]),
            )
          ]),

          Padding(
            padding: REdgeInsets.all(4),
            child: Row(
              children: [
                Image.asset(AssetsManager.star),
                SizedBox(width: 6.w,),
                Text('7.7' , style: AppStyle.ratingText,)
              ],
            ),
          ),
          Text('Dora and the ....', style: AppStyle.ratingText,),
          Text('2018  R  1h 59m', style: AppStyle.movieDate.copyWith(fontSize: 8.sp),),

        ],
      ),
    );
  }
}
