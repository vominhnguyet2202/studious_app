import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';

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
    fontSize: 22, fontWeight: FontWeight.w500, color: onSurfaceTextColor);
