import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/NewReleases/releases_item.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/releases_provider/releases_provider.dart';
class ReleasesWidget extends StatelessWidget
{
   const ReleasesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerReleases(),
      child: Consumer<providerReleases>(
        builder: (context, value, child) {
          // لو البيانات لسه مش محملة، نعرض شاشة تحميل
          if (value.releasesResponse.results == null || value.releasesResponse.results!.isEmpty) {
            value.getDataReleases(); // طلب البيانات لو مش محملة
            return Center(child: CircularProgressIndicator()); // شاشة تحميل
          }
          // لو البيانات جاهزة نعرض الـ ListView
          return Container(
            color: ColorsManager.black2,
            height: 187.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 15, bottom: 12),
                  child: Text(
                    value.releasesResponse.results![value.index].title ?? "No Title Available", // التأكد من العنوان
                    style: AppStyle.newReleaseTitle,
                  ),
                ),
                SizedBox(
                  height: 127.74.h,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 18),
                    scrollDirection: Axis.horizontal,
                    itemCount: value.releasesResponse.results?.length ?? 0, // تأكيد أن العدد أكبر من 0
                    itemBuilder: (context, index) {
                      // هنا بنعرض العنصر بناءً على الـ index
                      return ReleasesItem(index: index); // تمرير الـ index داخل الـ ReleasesItem
                    },
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