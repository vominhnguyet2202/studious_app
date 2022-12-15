import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
