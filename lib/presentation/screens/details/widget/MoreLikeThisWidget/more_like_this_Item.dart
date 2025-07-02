import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class MoreLikeThisItem extends StatelessWidget {
  int index;
  List<Map<String, dynamic>> mockData;
  
  MoreLikeThisItem({super.key, required this.index, required this.mockData});
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    
    return Container(
      width: 97.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.darkGrey2, width: 1.w),
        color: ColorsManager.darkGrey2,
        boxShadow: const [
          BoxShadow(
            color: ColorsManager.darkGrey2,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 0)
          )
        ],
        borderRadius: BorderRadius.circular(5.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 128.7.h,
                width: 96.87.w,
                child: CachedNetworkImage(
                  imageUrl: '$pathImageUrl${mockData[index]['poster_path']}',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                )
              ),
              InkWell(
                onTap: () {
                  // Static bookmark functionality
                },
                child: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                )
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 5.w),
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
                    SizedBox(width: 5.w),
                    Text(
                      "8.5", // Static rating
                      style: AppStyle.ratingText,
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  maxLines: 1,
                  mockData[index]['title'] ?? "",
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: ColorsManager.white
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 4.h),
                Text(
                  maxLines: 1,
                  "2023-12-25", // Static date
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 10,
                    color: ColorsManager.grey
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
