import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xff2e3c62);
const Color primaryColorDark = Color(0xff99ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorDark,
          displayColor: mainTextColorDark,
        ));
  }
}
