import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/screens/home/home.dart';
import 'package:movies_app/presentation/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.splash : (_) => const Splash(),
          RoutesManager.home : (_) => const Home(),
        },
        initialRoute: RoutesManager.splash,
      ),
    );
  }
}
