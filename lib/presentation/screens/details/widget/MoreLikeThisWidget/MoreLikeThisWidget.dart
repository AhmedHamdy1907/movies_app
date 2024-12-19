
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../provider/details_tap/more_like_this/more_like_this.dart';
import 'more_like_this_Item.dart';
class Morelikethiswidget extends StatelessWidget {
  const Morelikethiswidget({super.key});

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments as int?;
    return ChangeNotifierProvider(
      create: (context) => MoreLikeThisProvider(),
      child: Consumer<MoreLikeThisProvider>(
        builder: (context, value, child) {
          if (value.moreLikeThisResponse.results == null || value.moreLikeThisResponse.results!.isEmpty) {
            value.data(movieId); // إذا كانت البيانات غير محملة، نطلبها هنا
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
                    child: Text("More like this",style: AppStyle.newReleaseTitle),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 18,), // إلغاء المسافات من فوق وتحت
                        scrollDirection: Axis.horizontal,
                        itemCount: value.moreLikeThisResponse.results?.length,
                        itemBuilder: (context, index) =>    Padding(
                          padding: const EdgeInsets.only(right:13),
                          child: MoreLikeThisItem(index: index)
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



