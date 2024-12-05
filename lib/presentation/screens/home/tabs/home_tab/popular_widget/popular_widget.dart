import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';


class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 289.h,
      child: Stack(
        children: [
          SizedBox(
            height: 217.h,
              child: Image.asset('assets/images/Image.png',fit: BoxFit.cover,)),
          Positioned(
            top: 80.h,
            child: Padding(
              padding:  REdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 199.h,
                    width: 129.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Stack(
                        children: [
                          InkWell(onTap: (){
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutesManager.moviesDetails,
                                  (route) => route.settings.name != RoutesManager.moviesDetails, // الشرط ده يمنع التكرار
                            );

                          },
                              child: Image.asset('assets/images/Image (1).png',)),
                           InkWell(onTap: (){},
                              child: Image.asset('assets/images/bookmark (1).png',fit: BoxFit.cover,height: 36.h,width: 27.w,)),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 20.w,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 140.h,
                      ),
                      Text(
                        "Dora and the lost city of gold",
                        style: TextStyle(
                            fontSize: 14, color: ColorsManager.white),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "2019  PG-13  2h 7m",
                        style: TextStyle(
                            fontSize: 10.sp, color: ColorsManager.hintDate),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
