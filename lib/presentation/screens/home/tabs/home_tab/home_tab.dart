import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/popular_widget/PopularWidget.dart';
import 'NewReleases/releases_widget.dart';
import 'Recomended/Recomended.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           const PopularWidget(),
        SizedBox(height: 15.h,),
           const ReleasesWidget(),
        SizedBox(height: 15.h,),
        Recommended(),
      ],
    );
  }
}
