import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_style.dart';
import '../../../core/utils/color_manager.dart';
import '../../../provider/result_browser/result_browser.dart';

class BrowserResult extends StatelessWidget {
  const BrowserResult({super.key});

  @override
  Widget build(BuildContext context) {
    const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
    final id = ModalRoute.of(context)?.settings.arguments as num?;
    return ChangeNotifierProvider(
      create: (context) => ResultBrowserProvider()..getResultBrowser(id: id),
      child: Consumer<ResultBrowserProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                ),
                body: value.resultBrowserResponse.results == null ||
                    value.resultBrowserResponse.results!.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                  padding: REdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = value.resultBrowserResponse.results![index];
                      return Padding(
                        padding: REdgeInsets.only(bottom: 20),
                        child: Container(
                          padding: REdgeInsets.symmetric(horizontal: 15),
                          height: 199.h,
                          width: 260.w,
                          child: Row(
                            children: [
                              Container(
                                height: 199.h,
                                width: 129.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child:  value.resultBrowserResponse.results == null ||
                                    value.resultBrowserResponse.results!.isEmpty
                                    ? const Center(child: CircularProgressIndicator())
                                    : FittedBox(
                                  fit: BoxFit.cover,
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: '$pathImageUrl${item.posterPath}',
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                        const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          height: 140.h,
                                          width: 100.w,
                                          child: Image.asset(
                                            'assets/images/bookmark (1).png',
                                            fit: BoxFit.cover,
                                            height: 36.h,
                                            width: 27.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.h),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 13.h),
                                    Text(
                                      item.overview ?? "",
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle.movieDesc,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: ColorsManager.yellow, size: 20.sp),
                                        SizedBox(width: 5.w),
                                        Text(
                                          item.voteAverage?.toString() ?? "",
                                          style: AppStyle.ratingText.copyWith(fontSize: 18.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: value.resultBrowserResponse.results?.length,
                  ),
                )


            ),
          );
        },
      ),
    );
  }
}
