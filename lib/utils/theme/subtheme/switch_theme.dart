// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

class DSwitchTheme {
  DSwitchTheme._();

  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(defWht),
    trackColor: MaterialStatePropertyAll(defDBlu),
    trackOutlineColor: MaterialStatePropertyAll(defDBlu),
  );
  
  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(defDBlu),
    trackColor: MaterialStatePropertyAll(defWht),
    trackOutlineColor: MaterialStatePropertyAll(defWht),
  );
}