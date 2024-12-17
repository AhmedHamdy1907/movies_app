import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';

import '../../../../data/model/details_screen_Model/details_film/DetailsResponse.dart';


class MoviesDetailsWidget extends StatelessWidget {
  final DetailsResponse detailsData; // غيرت المتغير لـ final لأنه في StatelessWidget
  const MoviesDetailsWidget({super.key, required this.detailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 15),
      height: 199.h, // زودنا الارتفاع قليلاً ليتسع المحتوى
      width: 260.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GridView لعرض الأنواع
          Container(
            height: 65.h, // زودنا الارتفاع ليتسع لصفين من المربعات
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.5, // النسبة بين العرض والارتفاع للمربعات
                crossAxisCount: 3, // 3 مربعات في كل صف
                crossAxisSpacing: 4, // المسافة بين الأعمدة
                mainAxisSpacing: 6, // المسافة بين الصفوف
              ),
              itemBuilder: (context, index) {
                return buildBoxDescription(detailsData.genres![index].name.toString());
              },
              itemCount: detailsData.genres?.length ?? 0, // عدد العناصر
            ),
          ),
          SizedBox(height: 13.h),
          // وصف الفيلم
          Text(
            detailsData.overview ?? "",
            maxLines: 4, // تحديد عدد السطور المسموح بها
            overflow: TextOverflow.ellipsis, // لإضافة "..." في حالة تجاوز النص
            style: AppStyle.movieDesc,
          ),
          SizedBox(height: 20.h),
          // التقييم
          Row(
            children: [
              Icon(Icons.star, color: ColorsManager.yellow, size: 20.sp),
              SizedBox(width: 5.w),
              Text(
                "7.7",
                style: AppStyle.ratingText.copyWith(fontSize: 18.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildBoxDescription(String genres) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h), // ضبط الـ padding بشكل أفضل
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorsManager.iconColor),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          genres,
          maxLines: 1, // السماح بسطر واحد فقط
          overflow: TextOverflow.ellipsis, // إذا كان النص طويلًا
          style: AppStyle.movieType,
        ),
      ),
    );
  }
}
