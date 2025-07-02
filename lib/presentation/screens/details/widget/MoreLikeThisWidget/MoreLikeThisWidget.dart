
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/color_manager.dart';
import 'more_like_this_Item.dart';

class Morelikethiswidget extends StatelessWidget {
  const Morelikethiswidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Static mock data for more like this movies
    final mockMoreLikeThis = [
      {'id': 1, 'title': 'Batman Begins', 'poster_path': '/dr6x4GsyyUZOqO0qPg1epY9kzQf.jpg'},
      {'id': 2, 'title': 'The Dark Knight Rises', 'poster_path': '/85cWkCVftiVs0BVey6pxX8uNmLt.jpg'},
      {'id': 3, 'title': 'Batman v Superman', 'poster_path': '/5UsK3grJvtQrtzEgqNlDljJW96w.jpg'},
      {'id': 4, 'title': 'Joker', 'poster_path': '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg'},
      {'id': 5, 'title': 'Man of Steel', 'poster_path': '/6Bbq8qQWpoApLZYWFFAuZ1r2gFz.jpg'},
    ];

    return Padding(
      padding: REdgeInsets.only(top: 10.h),
      child: Container(
        color: ColorsManager.black2,
        height: 246.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 10, bottom: 12),
              child: Text("More like this", style: AppStyle.newReleaseTitle),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 18),
                scrollDirection: Axis.horizontal,
                itemCount: mockMoreLikeThis.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: MoreLikeThisItem(
                    index: index,
                    mockData: mockMoreLikeThis,
                  )
                )
              ),
            ),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}



