import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
final size=22;
TextStyle cartTitles(context) => TextStyle(
      color: UIParamenters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(
  fontSize: 12,
);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const headerTitle = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const questionTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const appBarTS = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 18 , color: onSurfaceTextColor);
TextStyle countDownTimerTs() => TextStyle(
    letterSpacing: 2,
    color: UIParamenters.isDarkMode()
        ? Theme.of(Get.context!).textTheme.bodyText1!.color
        : Theme.of(Get.context!).primaryColor);
