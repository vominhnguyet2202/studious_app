import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/dart_theme.dart';
import 'package:studious_app/configs/themes/light_theme.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnsweredColor = Color(0xFF2a3c65);

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient() =>
    UIParamenters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScafoldColor(BuildContext context) => UIParamenters.isDarkMode()
    ? const Color(0xff2e3c62)
    : const Color.fromARGB(255, 237, 240, 255);
const customBlackColor = Color(0xFF2e3c62);

const colorLightGreen = Color(0xff986fb9);
const colorLightRed = Colors.red;
Color answerSelectedColor() => UIParamenters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIParamenters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
