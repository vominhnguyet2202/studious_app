import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xff9999ff);
const Color primaryColorLight = Color.fromARGB(255, 239, 128, 185);
const Color mainTextColor = Color.fromARGB(255, 40, 20, 20);
const Color cardColor = Color.fromARGB(255, 255, 254, 255);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextThemes()
            .apply(bodyColor: mainTextColor, displayColor: mainTextColor));
  }
}
