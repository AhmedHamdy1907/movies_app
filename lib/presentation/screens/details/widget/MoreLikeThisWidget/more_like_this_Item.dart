import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/details_tap/more_like_this/more_like_this.dart';

class MoreLikeThisItem extends StatelessWidget {
  int index;
  MoreLikeThisItem({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return ChangeNotifierProvider(
      create: (context) => MoreLikeThisProvider(),
      child: Consumer<MoreLikeThisProvider>(
        builder: (context, value, child) {
          if (value.moreLikeThisResponse.results == null ||
              value.moreLikeThisResponse.results!.isEmpty) {
            value.getMoreLikeThis(); // إذا كانت البيانات غير محملة، نطلبها هنا
            return const Center(
                child:
                CircularProgressIndicator()); // نعرض شاشة تحميل حتى يتم تحميل البيانات
          }
          return Container(
            width: 97.w,
            // height: 200.h,
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.darkGrey2, width: 1.w),
                color: ColorsManager.darkGrey2,
                boxShadow: const [
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
                        width: 96.87.w,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutesManager.moviesDetails);
                            },
                            child: CachedNetworkImage(
                              imageUrl: '$pathImageUrl${value.moreLikeThisResponse.results?[index].posterPath}',
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(), // مؤشر انتظار أثناء التحميل
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error, // ويدجت تظهر لو حصل خطأ في التحميل
                                color: Colors.red,
                              ),
                            ))),
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AssetsManager.bookMark,
                          fit: BoxFit.fill,
                          height: 36.h,
                          width: 27.w,
                        )),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
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
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            value.moreLikeThisResponse.results![index].voteAverage!.toStringAsFixed(1),
                            style: AppStyle.ratingText,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        maxLines: 1, // حدد عدد السطور المسموح بها
                        value.moreLikeThisResponse.results![index].title ?? "",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            color: ColorsManager.white),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        maxLines: 1, // حدد عدد السطور المسموح بها
                        value.moreLikeThisResponse.results![index].releaseDate ?? "",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            color: ColorsManager.grey),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
