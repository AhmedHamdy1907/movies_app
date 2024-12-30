import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';

import '../../../../../../data/model/homeScreen_model/search_tap_model/Results.dart';

class SearchWidget extends StatelessWidget {
  List<ResultsSearch>? results;
  int index;

  SearchWidget({super.key, required this.results, required this.index});

  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.5.h,
        ),
        Row(
            children: [
          SizedBox(
            width: 140.w,
            height: 89.h,
            child: CachedNetworkImage(
              imageUrl:
                  '$pathImageUrl${results?[index].backdropPath}',
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(), // مؤشر انتظار أثناء التحميل
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                // ويدجت تظهر لو حصل خطأ في التحميل
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results?[index].title??"",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      color: ColorsManager.white),
                ),
                Text(
                  results?[index].releaseDate?.split('-')[0] ?? '',
                  style: AppStyle.movieDetails.copyWith(fontSize: 16.sp),
                ),
                Text(
                  results?[index].originalTitle??"",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      color: ColorsManager.white),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 13.5.h,
        ),
        Container(
          width: double.infinity,
          height: 2.h,
          color: ColorsManager.iconColor,
        )
      ],
    );
  }
}
