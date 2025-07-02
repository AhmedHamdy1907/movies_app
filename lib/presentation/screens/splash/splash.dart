import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
    return Stack(
      children: [
        Container(
          color: ColorsManager.black,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(child: Image.asset(AssetsManager.movies)),
        Align(
          alignment: Alignment.bottomCenter,
            child: Image.asset(AssetsManager.routeLogo)),
      ],
    );
  }
}
