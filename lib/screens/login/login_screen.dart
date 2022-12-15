import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/controllers/auth_controller.dart';
import 'package:studious_app/widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const String routerName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/app_splash_logo.png",
            width: 200,
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Text(
              "This is Studious App. You can  use as you want..",
              style: TextStyle(
                  color: onSurfaceTextColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          MainButton(
            onTap: () {
              controller.signInWithGoogle();
            },
            child: Stack(children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: SvgPicture.asset("assets/icons/google.svg"),
              ),
              Center(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
