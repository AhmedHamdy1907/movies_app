import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/data/model/recommended/RecommendedData.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/Recomended/Recomended.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/Recomended/RecomendedItem.dart';

class MoviesDetailsWidget extends StatelessWidget {
  const MoviesDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 15),
      height: 199.h,
      width: 231.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBoxDescription(),
          SizedBox(height: 13.h,),
          Text(
            'Having spent most of her life exploring the jungle,'
                ' nothing could prepare Dora for her most dangerous adventure yet — high school. ',
            style: AppStyle.movieDesc,),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Icon(Icons.star,color: ColorsManager.yellow,size: 20.sp,),
              SizedBox(width: 5.w,),
              Text("7.7",style: AppStyle.ratingText.copyWith(fontSize: 18.sp),),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBoxDescription() {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorsManager.iconColor),
          borderRadius: BorderRadius.circular(4.r)
      ),
      child: Text('Action', style: AppStyle.movieType,),
    );
  }
}
