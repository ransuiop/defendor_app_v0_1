// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(defDBlu),
              textStyle:
                  MaterialStatePropertyAll(DTypography.defStylightButtonText)));

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(defDBlu),
              textStyle:
                  MaterialStatePropertyAll(DTypography.defStydarkButtonText)));
}
