import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/new_releases/widget/new_releases_widget.dart';

class NewReleases extends StatelessWidget {
  const NewReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 187.h,
        color: ColorsManager.black3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(top: 14, bottom: 13, left: 25),
              child: Text(
                'New Releases',
                style: AppStyle.newReleaseTitle,
              ),
            ),
            SizedBox(
              height: 127.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) {
                  return Container(
                    margin: REdgeInsets.only(
                      left: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: NewReleasesWidget(),
                    ),
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
