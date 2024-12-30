import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../provider/details_tap/details_film/detailsFilm.dart';
import '../../../../../../provider/details_tap/more_like_this/more_like_this.dart';
import '../../../../../../provider/home_tap/popular_provider/provider_data.dart';
class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return ChangeNotifierProvider(
      create: (context) => PopularProvider(),
      child: Consumer< PopularProvider>(
        builder: (context, value, child) {
          if (value.popularResponse!.results == null ||
              value.popularResponse!.results!.isEmpty) {
            value.data();
            return const Center(
                child:
                    CircularProgressIndicator()); // نعرض شاشة تحميل حتى يتم تحميل البيانات
          }
          return SizedBox(
            height: 289.h,
            width: double.infinity,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      autoPlay: true,
                      height: 217.h,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        value.changeindex(index);
                      }),
                  items: value.popularResponse!.results!.map((e) {
                    return SizedBox(
                        height: 217.h,
                        width: double.infinity,
                        child: value.popularResponse!.results != null
                            ? Image.network(
                                '$pathImageUrl${e.backdropPath!}',
                                fit: BoxFit.fill,
                              )
                            : const Center(
                                child: CircularProgressIndicator()));
                  }).toList(),
                ),
                Positioned(
                  top: 90.h ,
                  child: Padding(
                    padding: REdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      width:400.w,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 199.h,
                            width: 118.w,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(50.r),
                            // ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Stack(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            arguments: value.popularResponse!.results?[value.index].id,
                                              context, RoutesManager.moviesDetails);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '$pathImageUrl${value.popularResponse!.results?[value.index].posterPath}',
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child:
                                                CircularProgressIndicator(), // مؤشر انتظار أثناء التحميل
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                      // ويدجت تظهر لو حصل خطأ في التحميل
                                            color: Colors.red,
                                          ),
                                        )),
                                    InkWell(
                                      onTap: () {},
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Icon(
                                          Icons.add_box_outlined,
                                          color: Colors.white,
                                          size: 100.sp,  // استخدم sp بدلاً من الحجم الثابت لتحديد الحجم بناءً على حجم الشاشة
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          SizedBox(
                            width: 230.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 130.h),
                                Text(
                                  maxLines: 2, // حدد عدد السطور المسموح بها
                                  value.popularResponse!.results![value.index]
                                          .title ??
                                      "",
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      color: ColorsManager.white),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  maxLines: 1, // حدد عدد السطور المسموح بها
                                  value.popularResponse!.results![value.index]
                                          .releaseDate ??
                                      "",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 10.sp,
                                      color: ColorsManager.hintDate),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


