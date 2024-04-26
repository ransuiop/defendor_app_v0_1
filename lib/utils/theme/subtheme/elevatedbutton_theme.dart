// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(defDBlu),
  ));

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(defXWht),
  ));
}
