// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class DListTileTheme {
  DListTileTheme._();

  static ListTileThemeData lightListTileTheme = ListTileThemeData(
    iconColor: defDBlu,
    tileColor: defWht,
    titleTextStyle: DTypography.defStylightSettTilesTitle,
    subtitleTextStyle: DTypography.defStylightSettTilesSubtitle,
  );

  static ListTileThemeData darkListTileTheme = ListTileThemeData(
    iconColor: defXWht,
    tileColor: defDBlu,
    titleTextStyle: DTypography.defStydarkSettTilesTitle,
    subtitleTextStyle: DTypography.defStydarkSettTilesSubtitle,
  );
}