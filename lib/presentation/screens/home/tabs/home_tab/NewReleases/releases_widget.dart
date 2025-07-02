import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/NewReleases/releases_item.dart';

class ReleasesWidget extends StatelessWidget {
  const ReleasesWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Static mock data for new releases
    final mockReleases = [
      {'id': 1, 'title': 'Spider-Man: No Way Home', 'poster_path': '/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg'},
      {'id': 2, 'title': 'The Batman', 'poster_path': '/74xTEgt7R36Fpooo50r9T25onhq.jpg'},
      {'id': 3, 'title': 'Doctor Strange 2', 'poster_path': '/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg'},
      {'id': 4, 'title': 'Top Gun: Maverick', 'poster_path': '/62HCnUTziyWcpDaBO2i1DX17ljH.jpg'},
      {'id': 5, 'title': 'Black Panther 2', 'poster_path': '/sv1xJUazXeYqALzczSZ3O6nkOVp.jpg'},
    ];

    return Container(
      color: ColorsManager.black2,
      height: 195.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 15, bottom: 12),
            child: Text(
              "New Releases",
              style: AppStyle.newReleaseTitle,
            ),
          ),
          SizedBox(
            height: 127.74.h,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 18),
              scrollDirection: Axis.horizontal,
              itemCount: mockReleases.length,
              itemBuilder: (context, index) {
                return ReleasesItem(
                  index: index,
                  mockData: mockReleases,
                );
              },
            ),
          ),
          Container(
            height: 13.h,
          )
        ],
      ),
    );
  }
}