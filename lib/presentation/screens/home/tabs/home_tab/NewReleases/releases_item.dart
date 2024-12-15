import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/screens/details/movies_details.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/releases_provider/releases_provider.dart';

class ReleasesItem extends StatelessWidget {
  int index;
   ReleasesItem({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    return ChangeNotifierProvider(
      create: (context) => providerReleases(),
      child: Consumer<providerReleases>(
        builder: (context, value, child) {
          // لو البيانات لسه مش محملة، نعرض شاشة تحميل
          if (value.releasesResponse.results == null || value.releasesResponse.results!.isEmpty) {
            value.getDataReleases(); // طلب البيانات لو مش محملة
            return Center(child: CircularProgressIndicator()); // شاشة تحميل
          }
          return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r)
          ),
          child: Padding(
            padding:  REdgeInsets.only(right: 13,),
            child: Row(
              children: [
                // const SizedBox(width: 13,),
                Stack(
                  children: [
                    SizedBox(
                      height: 127.74.h,
                        width: 96.87.w,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(RoutesManager.moviesDetails,);                },
                            child: value.releasesResponse.results!=null?Image.network(
                              '$pathImageUrl${value.releasesResponse.results?[index].posterPath}',
                              fit: BoxFit.fill,
                            ): const Center(child: CircularProgressIndicator())
                        )),
                    InkWell(onTap: (){},
                        child: Image.asset(AssetsManager.bookMark ,fit: BoxFit.cover,height: 36.h,width: 27.w,)),
                  ],
                ),
              ],
            ),
          ),
        );},
      ),
    );
  }
}
