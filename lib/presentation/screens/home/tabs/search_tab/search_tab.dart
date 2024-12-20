import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/search_tab/widget/search_widget.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/widget/watch_widget.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          TextFormField(
            style: AppStyle.movieTitle.copyWith(fontSize: 15.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search,color: ColorsManager.white, ),
              hintText: 'Search',
              hintStyle: AppStyle.hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsManager.white, width: 1.w),
                borderRadius: BorderRadius.circular(40),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsManager.darkGray, width: 1.w),
                borderRadius: BorderRadius.circular(40),
              )
          )),
          Expanded(child: ListView.builder(itemBuilder:(context, index) =>  const SearchWidget(), itemCount: 5,))

        ],
      ),
    );
  }
}
