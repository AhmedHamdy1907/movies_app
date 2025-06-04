import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';

import '../../../../../../data/model_FireStore/firestoremodel.dart';

class WatchWidget extends StatelessWidget {
  FireStoreModel fireStoreModel;
   WatchWidget({super.key,required this.fireStoreModel});
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(40.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.5.h,),
          Row(
            children:[
            Stack(
                children: [
          Container(
            width: 140.h,
            height: 88.h,
            child: CachedNetworkImage(
            imageUrl:
              '$pathImageUrl${fireStoreModel.image}',
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
                  Image.asset(
                    AssetsManager.bookMark,
                    fit: BoxFit.cover,
                    height: 36.h,
                    width: 27.w,
                  )
                ]),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     fireStoreModel.title ??"",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16.sp,
                          color: ColorsManager.white),
                    ),
                    Text(fireStoreModel.date??"", style: AppStyle.movieDetails.copyWith(fontSize: 16),),
                    Text(
                      fireStoreModel.description??"",
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16.sp,
                          color: ColorsManager.white),
                    ),
                  ],
                ),
              ),
            ]
          ),
          SizedBox(height: 13.5.h,),
          Container(width: double.infinity, height: 2.h, color: ColorsManager.iconColor,)
        ],
      ),
    );
  }
}
