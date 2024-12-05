import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/details/widget/movies_details_widget.dart';

import '../home/tabs/home_tab/Recomended/Recomended.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.appBarColor,
          title: Text('Dora and the lost city of gold' ,style : AppStyle.moviesDetailsTitle),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image.asset('assets/images/Image.png'),
            SizedBox(height: 13.h,),
            Padding(
              padding: REdgeInsets.symmetric(horizontal:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dora and the lost city of gold', style: AppStyle.moviesDetailsTitle.copyWith(fontSize: 18),),
                  SizedBox(height: 8.h,),
                  Text('2019  PG-13  2h 7m ', style: AppStyle.movieDate.copyWith(fontSize: 12),),
                  SizedBox(height: 18.h,),
                  Row(
                    children: [
                      Container(
                        height: 199.h,
                        width: 129.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r)
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Stack(
                            children: [
                              Image.asset('assets/images/Image (1).png',),
                              InkWell(onTap: (){},
                                  child: Image.asset('assets/images/bookmark (1).png',fit: BoxFit.cover,height: 36.h,width: 27.w,)),
                            ],
                          ),
                        ),
                      ),
                      MoviesDetailsWidget(),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Recommended(title: 'More Like This',),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
