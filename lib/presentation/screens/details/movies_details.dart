import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/data/model_Api/details_screen_Model/details_film/DetailsResponse.dart';
import 'package:movies_app/data/model_Api/details_screen_Model/details_film/Genres.dart';
import 'package:movies_app/presentation/screens/details/widget/MoreLikeThisWidget/MoreLikeThisWidget.dart';
import 'package:movies_app/presentation/screens/details/widget/movies_details_widget.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments as num?;
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    
    // Static mock data for movie details
    final mockMovieDetails = DetailsResponse(
      id: movieId ?? 1,
      title: 'The Dark Knight',
      posterPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      backdropPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      releaseDate: '2008-07-18',
      overview: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      voteAverage: 9.0,
      runtime: 152,
      genres: [
        GenresBrowser(id: 1, name: 'Action'),
        GenresBrowser(id: 2, name: 'Crime'),
        GenresBrowser(id: 3, name: 'Drama'),
      ],
    );
    
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
            maxLines: 1,
            mockMovieDetails.title ?? "",
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
                imageUrl: '$pathImageUrl${mockMovieDetails.posterPath}',
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 13.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    mockMovieDetails.title ?? "",
                    style: AppStyle.moviesDetailsTitle
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    mockMovieDetails.releaseDate ?? "",
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
                                imageUrl: '$pathImageUrl${mockMovieDetails.posterPath}',
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Static bookmark functionality
                                },
                                child: SizedBox(
                                  height: 140.h,
                                  width: 100.w,
                                  child: const Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MoviesDetailsWidget(detailsData: mockMovieDetails),
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
  }
}