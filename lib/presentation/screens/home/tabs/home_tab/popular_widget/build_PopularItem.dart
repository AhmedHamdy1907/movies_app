import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/UseFirebase.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../data/model_Api/homeScreen_model/home_Tap_Model/popular_movies/Results.dart';
import '../../../../../../data/model_FireStore/firestoremodel.dart';
import '../../../../../../provider/provider_chiled/provider_chiled.dart';
class BuildPopularitem extends StatelessWidget {
  List<ResultsPopular>? resultsPopular;
  int index;
  bool IsDone=false;
  BuildPopularitem({super.key, required this.resultsPopular, required this.index});
  @override
  Widget build(BuildContext context) {
    List<String> IamgeBookmark = List.generate(resultsPopular!.length, (index) => AssetsManager.bookMark); // تعريف القائمة خارج الدالة
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return ChangeNotifierProvider(
      create:  (context) => ProviderChild(),
      child: Consumer<ProviderChild>(
        builder: (context, value, child)
        {
          return Positioned(top: 90.h, child: Padding(
            padding: REdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: 400.w,
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
                                      arguments: resultsPopular?[index].id,
                                      context,
                                      RoutesManager.moviesDetails);
                                },
                                child: CachedNetworkImage(
                                  imageUrl:
                                  '$pathImageUrl${resultsPopular?[index].posterPath}',
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const Center(
                                    child:
                                    CircularProgressIndicator(), // مؤشر انتظار أثناء التحميل
                                  ),
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.error,
                                    // ويدجت تظهر لو حصل خطأ في التحميل
                                    color: Colors.red,
                                  ),
                                )),
                            buildAddFirebase(value,resultsPopular?.length)
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
                          resultsPopular?[index].title ?? "",
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              color: ColorsManager.white),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          maxLines: 1, // حدد عدد السطور المسموح بها
                          resultsPopular?[index].releaseDate ?? "",
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
          ),);

        }
      ),
    );
  }

  Widget buildAddFirebase(ProviderChild value,int? lengthList)
 {
   return InkWell(
         onTap: () {
           value.ChangeIsDone();
           value.getBookmarkImage(check: value.isDone,index:index );
           // value.changIamge(index:index ,length: lengthList);
           FireStoreModel fireStoreModel =  FireStoreModel
             (
               id: resultsPopular?[index].id,
               image: resultsPopular?[index].backdropPath,
               date: resultsPopular?[index].releaseDate,
               title: resultsPopular?[index].title,
               description: resultsPopular?[index].originalTitle,
               isdone: value.isDone
           );
           var data=fireStoreModel.toJsonMovies();
           UseFirebase useFirebase=UseFirebase(data: data);
           useFirebase.ToSendData(resultsPopular?[index].id.toString());

         },
         child: FittedBox(
           fit: BoxFit.fill,
           child: SizedBox(
               width: 150.w,
               height: 150.h,
               child: Image.asset(value.Image??"",fit:BoxFit.fill,)),
         ),

       );
     }

  Widget buildRemoveFirebase ()
  {
    return InkWell(
      onTap: ()
      {

      },
      child: FittedBox(
        fit: BoxFit.fill,
        child: SizedBox(
            width: 150.w,
            height: 150.h,
            child: Image.asset(AssetsManager.addedBookMark,fit:BoxFit.fill,)),
      ),

    );

  }
}
