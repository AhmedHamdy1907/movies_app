import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.w,
      height: 184.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.darkGrey2, width: 1.w),
          color: ColorsManager.darkGrey2,
          boxShadow: const[
            BoxShadow(
                color: ColorsManager.darkGrey2,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(5.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: 128.7.h,
                  width: double.infinity,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RoutesManager.moviesDetails,
                        );
                      },
                      child: Image.asset(
                        'assets/images/Image (1).png',
                        fit: BoxFit.cover,
                      ))),
              InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AssetsManager.bookMark,
                    fit: BoxFit.cover,
                    height: 36.h,
                    width: 27.w,
                  )),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorsManager.yellow,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "7.7",
                      style: AppStyle.ratingText,)
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Deadpool 2",
                  style: AppStyle.ratingText.copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "2018  R  1h 59m",
                  style:AppStyle.movieDate,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
