import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';

class WatchWidget extends StatelessWidget {
  const WatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(40.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.5.h,),
          Row(
            children:[
            Stack(
                children: [
                  Image.asset('assets/images/Image.png', width: 160.w,),
                  Image.asset(
                    AssetsManager.bookMark,
                    fit: BoxFit.cover,
                    height: 36.h,
                    width: 27.w,
                  )
                ]),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alita Battle Angel', style: AppStyle.movieTitle.copyWith(fontSize: 16),),
                  Text('2018', style: AppStyle.movieDetails.copyWith(fontSize: 16),),
                  Text('Alita Battle Angel', style: AppStyle.movieDetails.copyWith(fontSize: 16),),
                ],
              ),
            ]
          ),
          SizedBox(height: 13.5.h,),
          Container(width: double.infinity, height: 2.h, color: ColorsManager.iconColor,)
        ],
      ),
    );
  }
}
