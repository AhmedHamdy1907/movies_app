import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/screens/details/movies_details.dart';

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
          SizedBox(
            height: 127.74.h,
              width: 96.87.w,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RoutesManager.moviesDetails,);                },
                  child: Image.asset('assets/images/Image (1).png',fit: BoxFit.cover,))),
          InkWell(onTap: (){},
              child: Image.asset('assets/images/bookmark (1).png',fit: BoxFit.cover,height: 36.h,width: 27.w,)),
        ],
      ),
    );
  }
}
