import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/recommended_provider/recommended_provider.dart';
import 'RecomendedItem.dart';

class Recommended extends StatelessWidget {
  // bool isNavigate;
  Recommended({super.key, required this.title,});
  String title;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecommendedProvider(),
      child: Consumer<RecommendedProvider>(
        builder: (context, value, child) {
          if (value.recommendedResponse.results == null || value.recommendedResponse.results!.isEmpty) {
            value.getRecommended(); // إذا كانت البيانات غير محملة، نطلبها هنا
            return const Center(child: CircularProgressIndicator()); // نعرض شاشة تحميل حتى يتم تحميل البيانات
          }
          return Padding(
          padding:  REdgeInsets.only(top: 10.h),
          child: Container(
            color: ColorsManager.black2,
            height: 246.h ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18,top: 10 ,bottom: 12),
                  child: Text(title,style: AppStyle.newReleaseTitle),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 18,), // إلغاء المسافات من فوق وتحت
                      scrollDirection: Axis.horizontal,
                      itemCount: value.recommendedResponse.results?.length,
                      itemBuilder: (context, index) =>    Padding(
                        padding: const EdgeInsets.only(right:13),
                        child: RecommendedItem(index: index,),
                      )),
                ),
                SizedBox(height: 10.h,)
              ],
            ),
          ),
        );
          },
      ),
    );

  }
}
