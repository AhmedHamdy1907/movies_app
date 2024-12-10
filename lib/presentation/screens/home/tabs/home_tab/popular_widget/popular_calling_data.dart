import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/model/popular_movies/Results.dart';
import '../../../../../../data/model/popular_movies/Popular_response.dart';
import 'PopularWidget.dart';


class popularCallingData extends StatelessWidget {
  const popularCallingData({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopular(),
        builder: (context, snapshot)// ال snapshot هي ال data اللي جت من الل api
        {
          if (snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          if(snapshot.data?.success==false||snapshot.hasError)
            {
              return Text(snapshot.data?.statusMessage??snapshot.error.toString(),style: const TextStyle(color: Colors.red),);
            }
          List<ResultsPopular>results=snapshot.data!.results!;
          return PopularWidget(results:results);
        },);
  }

}

