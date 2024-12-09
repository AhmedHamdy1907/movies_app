import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/model/popular_movies/Results.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/routes_manager.dart';
class PopularWidget extends StatelessWidget {
 List <Results> results;
   PopularWidget({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    const String pathImageUrl="https://image.tmdb.org/t/p/w500";
    return Container(
      height: 289.h,
      child: Stack(
        children: [
          Container(
              height: 217.h,
              width: double.infinity,
              child: Image.network(
                results[2].backdropPath != null
                    ? '$pathImageUrl${results[3].backdropPath!}'
                    : 'https://via.placeholder.com/500',fit: BoxFit.fill, // صورة افتراضية لو مفيش مسار
              )
          ),
          Positioned(
            top: 90.h,
            child: Padding(
              padding:  REdgeInsets.only(left: 20.w),
              child: Row(
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
                          InkWell(onTap: (){
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutesManager.moviesDetails,
                                  (route) => route.settings.name != RoutesManager.moviesDetails, // الشرط ده يمنع التكرار
                            );

                          },
                              child: Image.network(
                                results[2].backdropPath != null
                                    ? '$pathImageUrl${results[3].posterPath!}'
                                    : 'https://via.placeholder.com/500',fit: BoxFit.fill, // صورة افتراضية لو مفيش مسار
                              )

                          ),
                          InkWell(onTap: (){},
                              child: SizedBox(
                                height: 140.h,
                                  width: 100.w,
                                  child: Image.asset(AssetsManager.bookMark,fit: BoxFit.cover,))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 115.h,
                      ),
                      Text(
                        results[3].title??""
                        ,
                        style: TextStyle(
                            fontSize: 14, color: ColorsManager.white),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        results[3].releaseDate??""
                        ,
                        style: TextStyle(
                            fontSize: 10.sp, color: ColorsManager.hintDate),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
