import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/details/movies_details.dart';
import 'package:movies_app/presentation/screens/home/home.dart';
import 'package:movies_app/presentation/screens/splash/splash.dart';

import '../../presentation/screens/browserResulteScreen/browserResult.dart';

class RoutesManager{
   static const String splash = '/splash';
   static const String home = '/home';
   static const String moviesDetails = '/moviesDetails';
   static const String browserResult = '/BrowserResult';


   static Route? router(RouteSettings settings) {
      switch (settings.name) {
         case splash:
            return MaterialPageRoute(
               settings: settings,
               builder: (context) => const Splash(),
            );
         case home:
            return MaterialPageRoute(
               settings: settings,
               builder: (context) => const Home(),
            );
         case moviesDetails:
            return MaterialPageRoute(
               settings: settings,
               builder: (context) => const MoviesDetails(),
            );
         case  browserResult :
            return MaterialPageRoute(
                settings: settings,
                builder: (context) => const BrowserResult());
      }
      return null;
   }
}