import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/dart_theme.dart';
import 'package:studious_app/configs/themes/light_theme.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';

const Color onSurfaceTextColor = Colors.white;

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
