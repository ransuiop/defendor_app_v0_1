// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

class DRadioTheme {
  DRadioTheme._();

  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: MaterialStatePropertyAll(defLBlu),
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: MaterialStatePropertyAll(defXWht),
  );
}