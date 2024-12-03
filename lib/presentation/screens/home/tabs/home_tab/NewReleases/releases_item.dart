import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleasesItem extends StatelessWidget {
  const ReleasesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(5.r)
      ),
      child: Stack(
        children: [
          Container(
            height: 127.74.h,
              width: 96.87.w,
              child: Image.asset('assets/images/Image (1).png',fit: BoxFit.cover,)),
          InkWell(onTap: (){},
              child: Image.asset('assets/images/bookmark (1).png',fit: BoxFit.cover,height: 36.h,width: 27.w,)),
        ],
      ),
    );
  }
}
