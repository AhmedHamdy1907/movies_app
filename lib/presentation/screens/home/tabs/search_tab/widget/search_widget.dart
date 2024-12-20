import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20.5.h,),
        Row(
            children:[
              Image.asset('assets/images/Image.png', width: 160.w,),
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
    );
  }
}
