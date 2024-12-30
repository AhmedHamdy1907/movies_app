import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';

import '../../../../../../core/utils/routes_manager.dart';
import '../../../../../../data/model/details_screen_Model/details_film/Genres.dart';

class BrowseWidget extends StatelessWidget {
  List<GenresBrowser>? genres;
  int index;
   BrowseWidget({super.key,required this.genres,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            arguments: genres?[index].id,
              context,RoutesManager.browserResult);
        },
        child: Row(
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
                  Text(genres?[index].name??"", style: AppStyle.action,),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
