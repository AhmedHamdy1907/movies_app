import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/screens/details/widget/MoreLikeThisWidget/MoreLikeThisWidget.dart';
import 'package:movies_app/presentation/screens/details/widget/movies_details_widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/details_tap/details_film/detailsFilm.dart';
import '../../../provider/details_tap/more_like_this/more_like_this.dart';
class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => detailsFilmProvider()..getdetailsFilme(),),
        ChangeNotifierProvider(create: (context) => MoreLikeThisProvider()..getMoreLikeThis(),)
      ],
      child: Consumer2<detailsFilmProvider, MoreLikeThisProvider>(
        builder: (context, detailsvalue, MoreLikeThis, child) {
          detailsvalue.getdetailsFilme();
          MoreLikeThis.getMoreLikeThis();
          // if (value.detailsResponse.belongsToCollection == null ||
          //     value2.moreLikeThisResponse.results!.isEmpty) {
          //   return const Center(
          //       child: CircularProgressIndicator()); // شاشة تحميل
          // }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesManager.home);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                backgroundColor: ColorsManager.appBarColor,
                title: Text(
                  maxLines: 1, // حدد عدد السطور المسموح بها
                  detailsvalue.detailsResponse.title ??
                      "",
                  style: AppStyle.moviesDetailsTitle
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                width: double.infinity,
                height: 217,
                child: CachedNetworkImage(
                imageUrl:
                '$pathImageUrl${detailsvalue.detailsResponse.posterPath}',
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
                ),
              ), SizedBox(height: 13.h),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            maxLines: 1, // حدد عدد السطور المسموح بها
                            detailsvalue.detailsResponse.title ??
                                "",
                            style: AppStyle.moviesDetailsTitle
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          detailsvalue.detailsResponse.releaseDate??"",
                          style: AppStyle.movieDate.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            Container(
                              height: 199.h,
                              width: 129.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                      '$pathImageUrl${detailsvalue.detailsResponse.posterPath}',
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
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        height: 140.h,
                                        width: 100.w,
                                        child: Image.asset(
                                          'assets/images/bookmark (1).png',
                                          fit: BoxFit.cover,
                                          height: 36.h,
                                          width: 27.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                             MoviesDetailsWidget(detailsData: detailsvalue.detailsResponse,),
                          ],
                        ),
                        const Morelikethiswidget()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  }











