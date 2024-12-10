import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/app_style.dart';

class BrowseWidget extends StatelessWidget {
  const BrowseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
            children: [
              SizedBox(
              width: 158.w,
              height: 90.h,
              child: Image.asset('assets/images/Image.png'),
            ),
              Text('Action', style: AppStyle.action,),
            ]
        ),
      ],
    );
  }
}
