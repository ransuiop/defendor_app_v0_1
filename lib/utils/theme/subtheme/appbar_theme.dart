// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

class DAppBarTheme {
  DAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: defLBlu,
  );
  static BottomAppBarTheme lightBottomAppBarTheme = BottomAppBarTheme(
    color: defDBlu,
    height: 30,
    elevation: 4,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: defDBlu,
  );
  static BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    color: defXWht,
    height: 30,
    elevation: 4,
  );
}