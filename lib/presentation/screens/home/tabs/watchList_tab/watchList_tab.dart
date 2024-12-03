import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/widget/watch_widget.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 20, ),
      color: ColorsManager.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 78.h,),
          Text('Watch List', style: AppStyle.watchList,),
          Expanded(child: ListView.builder(itemBuilder:(context, index) =>  WatchWidget(), itemCount: 5,))
        ],
      ),
    );
  }
}
