import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Static splash - no navigation delay
    return Stack(
      children: [
        Container(
          color: ColorsManager.black,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: Image.network(
            'https://via.placeholder.com/200x200/FF6B6B/FFFFFF?text=Movies',
            width: 200,
            height: 200,
          )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.network(
            'https://via.placeholder.com/150x50/4ECDC4/FFFFFF?text=Route',
            width: 150,
            height: 50,
          )
        ),
      ],
    );
  }
}
