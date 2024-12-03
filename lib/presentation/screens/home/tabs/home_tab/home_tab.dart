import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/new_releases/new_releases.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/recommended/recommended.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
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
          Positioned(
            top: 95.h,
            child: Stack(
              children: [
                Container(
                  margin: REdgeInsets.symmetric(horizontal: 17),
                  width: 129.w,
                  height: 199.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Stack(children: [
                    Image.asset(
                      'assets/images/Image (1).png',
                      width: 129.w,
                    ),
                    InkWell(
                      onTap: (){
                        //add to watch list
                      },
                      child: Stack(children: [
                        Icon(
                          Icons.bookmark,
                          color: ColorsManager.iconColor.withOpacity(0.87),
                          size: 50,
                        ),
                        Positioned(
                            top: 9.h,
                            left: 13.w,
                            child: const Icon(
                              Icons.add,
                              color: ColorsManager.white,
                            )),
                      ]),
                    )
                  ]),
                ),
              ],
            ),
          )
        ]),
        SizedBox(height: 24.h,),
        NewReleases(),
        SizedBox(height: 30.h,),
        Recommended(),

      ],
    );
  }
}
