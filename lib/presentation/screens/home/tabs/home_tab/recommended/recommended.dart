import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/recommended/widget/recommended_widget.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 246.h,
      width: double.infinity,
      padding: REdgeInsets.only(left: 20, top: 10),
      color: ColorsManager.black3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: REdgeInsets.only(bottom: 13, left: 10),
            child: Text(
              'Recommended',
              style: AppStyle.newReleaseTitle,
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return Container(
                  margin: REdgeInsets.only(
                    right: 20, bottom: 12
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: RecommendedWidget(),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
