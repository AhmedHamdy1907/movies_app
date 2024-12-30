import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/search_tab/widget/search_widget.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/widget/watch_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/homeScreen_model/search_tap_model/Results.dart';
import '../../../../../provider/search_tap/search_provider.dart';

class SearchTab extends StatelessWidget {
   SearchTab({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => searchProvider(),
      child: Consumer<searchProvider>(
        builder: (context, value, child) {
          List<ResultsSearch>?results=value.searchResponse.results;
          return  Padding(
            padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onFieldSubmitted: (valueText)
                    {
                      value.getSearchData(search: valueText);
                    },
                      // controller:textEditingController,
                      // validator: (input)
                      // {
                      //   if(input==null||input.trim().isEmpty)
                      //   {
                      //     return "Plz , enter full Text";
                      //   }
                      //   return null;
                      // } ,
                      style: AppStyle.movieTitle.copyWith(fontSize: 15.sp),
                      decoration: biuldinputDecoration()),
                  buildNoFounData(results),
                ],
              ),
            ),
          );
        },
      ),
    );

  }

  Widget buildNoFounData (List<ResultsSearch>?resulte)
  {
    if(resulte==null||resulte.isEmpty)
      {
        return  Padding(
          padding: REdgeInsets.only(top:260.h ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_movies,color: Colors.white,size: 120,),
              Text("No Movies Found",style: TextStyle(color: ColorsManager.grey),)
            ],
          ),
        );
      }
    return Expanded(child: ListView.builder(
      itemBuilder: (context, index) =>   SearchWidget(results:resulte,index: index,),
      itemCount: resulte.length??0,));
  }
  InputDecoration biuldinputDecoration()
  {
    return InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: Colors.red,width: 2)
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.white,width: 2)
        ),
        prefixIcon: const Icon(
          Icons.search, color: ColorsManager.white,),
        hintText: 'Search',
        hintStyle: AppStyle.hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorsManager.white, width: 1.w),
          borderRadius: BorderRadius.circular(40.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorsManager.darkGray, width: 1.w.r),
          borderRadius: BorderRadius.circular(40),
        )
    );

  }
}
