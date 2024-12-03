import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/color_manager.dart';

class NewReleasesWidget extends StatelessWidget {
  const NewReleasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/Image (1).png',
        height: 127.h,
        width: 96.w,
      ),
      InkWell(
        onTap: () {
          //add to watch list
        },
        child: Stack(children: [
          Icon(
            Icons.bookmark,
            color:
            ColorsManager.iconColor.withOpacity(0.87),
            size: 40.sp,
          ),
          Positioned(
              top: 9.h,
              left: 10.w,
              child: Icon(
                Icons.add,
                color: ColorsManager.white, size: 20.sp,
              )),
        ]),
      )
    ]);
  }
}
