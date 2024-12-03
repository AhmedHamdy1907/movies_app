import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/color_manager.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 95.h,
      child: Stack(
        children: [
          Container(
            margin: REdgeInsets.symmetric(horizontal: 17),
            width: 129.w,
            height: 199.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Stack(children: [
              Image.asset(
                'assets/images/Image (1).png',
                width: 129.w,
              ),
              InkWell(
                onTap: (){
                  //add to watch list
                },
                child: Stack(children: [
                  Icon(
                    Icons.bookmark,
                    color: ColorsManager.iconColor.withOpacity(0.87),
                    size: 50,
                  ),
                  Positioned(
                      top: 9.h,
                      left: 13.w,
                      child: const Icon(
                        Icons.add,
                        color: ColorsManager.white,
                      )),
                ]),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
