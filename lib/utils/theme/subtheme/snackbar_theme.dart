// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

class DSnackBarTheme {
  DSnackBarTheme._();

  static SnackBarThemeData lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: defLBlu,
    elevation: 5,
  );

  static SnackBarThemeData darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: defXWht,
    elevation: 5,
  );
}