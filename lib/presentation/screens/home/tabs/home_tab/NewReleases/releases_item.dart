import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class ReleasesItem extends StatelessWidget {
  int index;
  List<Map<String, dynamic>> mockData;
  
  ReleasesItem({super.key, required this.index, required this.mockData});
  
  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    
    return Container(
      width: 96.87.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r)
      ),
      child: Padding(
        padding: REdgeInsets.only(right: 13),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          arguments: mockData[index]['id'],
                          RoutesManager.moviesDetails,
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: '$pathImageUrl${mockData[index]['poster_path']}',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      )
                    )
                  ),
                  InkWell(
                    onTap: () {
                      // Static add functionality
                    },
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                        size: 150.sp,
                      )
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
