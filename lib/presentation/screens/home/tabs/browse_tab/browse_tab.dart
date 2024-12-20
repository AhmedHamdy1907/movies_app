import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/browse_tab/widget/browse_widget.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: 20, vertical: 20
      ),
      color: ColorsManager.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 52.h,
          ),
          Text(
            'Browse Category',
            style: AppStyle.titles,
          ),
          SizedBox(
            height: 19.5.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) => const BrowseWidget(),
              itemCount: 16,
            ),
          )
        ],
      ),
    );
  }
}
