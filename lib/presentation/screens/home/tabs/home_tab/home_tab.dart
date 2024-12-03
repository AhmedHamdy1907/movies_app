import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/popular_widget/popular_widget.dart';

import 'NewReleases/releases_widget.dart';
import 'Recomended/Recomended.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularWidget(),
        SizedBox(height: 20.h,),
        ReleasesWidget(),
        SizedBox(height: 20.h,),
        Recommended(title: 'Recommended',),
      ],
    );
  }
}
