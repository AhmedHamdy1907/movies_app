import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../data/model_Api/homeScreen_model/home_Tap_Model/popular_movies/Results.dart';

class BuildPopularitem extends StatelessWidget {
  List<ResultsPopular>? resultsPopular;
  int index;
  
  BuildPopularitem({super.key, required this.resultsPopular, required this.index});
  
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    
    return Positioned(
      top: 90.h, 
      child: Padding(
        padding: REdgeInsets.only(left: 20.w),
        child: SizedBox(
          width: 400.w,
          child: Row(
            children: [
              SizedBox(
                height: 199.h,
                width: 118.w,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              arguments: resultsPopular?[index].id,
                              context,
                              RoutesManager.moviesDetails
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: '$pathImageUrl${resultsPopular?[index].posterPath}',
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
                        buildStaticBookmark()
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
                      maxLines: 2,
                      resultsPopular?[index].title ?? "",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: ColorsManager.white
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      maxLines: 1,
                      resultsPopular?[index].releaseDate ?? "",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10.sp,
                        color: ColorsManager.hintDate
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStaticBookmark() {
    return InkWell(
      onTap: () {
        // Static bookmark - no functionality
      },
      child: FittedBox(
        fit: BoxFit.fill,
        child: SizedBox(
          width: 150.w,
          height: 150.h,
          child: const Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
