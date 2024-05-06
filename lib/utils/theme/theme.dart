import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/appbar_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/dialog_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/divider_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/elevatedbutton_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/listtile_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/progressindicator_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/radio_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/snackbar_theme.dart';
import 'package:defendor_app_v0_1/utils/theme/subtheme/switch_theme.dart';
import 'package:flutter/material.dart';

class DTheme {
  DTheme._();
//TODO: REMEMBER TO ADD CONDITIONAL FOR TEXT STYLES
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Metropolis',
    brightness: Brightness.light,
    scaffoldBackgroundColor: defWht,
    appBarTheme: DAppBarTheme.lightAppBarTheme,
    bottomAppBarTheme: DAppBarTheme.lightBottomAppBarTheme,
    dialogTheme: DDialogTheme.lightDialogTheme,
    dividerTheme: DDividerTheme.lightDividerTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    // floatingActionButtonTheme: ,
    listTileTheme: DListTileTheme.lightListTileTheme,
    progressIndicatorTheme: DProgressIndicatorTheme.lightProgressIndicatorTheme,
    radioTheme: DRadioTheme.lightRadioTheme,
    snackBarTheme: DSnackBarTheme.lightSnackBarTheme,
    switchTheme: DSwitchTheme.lightSwitchTheme,
    // tooltipTheme: ,
  );

  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Metropolis',
    brightness: Brightness.light,
    scaffoldBackgroundColor: defDBlu,
    appBarTheme: DAppBarTheme.darkAppBarTheme,
    bottomAppBarTheme: DAppBarTheme.darkBottomAppBarTheme,
    dialogTheme: DDialogTheme.darkDialogTheme,
    dividerTheme: DDividerTheme.darkDividerTheme,
    elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
    // floatingActionButtonTheme: ,
    listTileTheme: DListTileTheme.darkListTileTheme,
    progressIndicatorTheme: DProgressIndicatorTheme.darkProgressIndicatorTheme,
    radioTheme: DRadioTheme.darkRadioTheme,
    snackBarTheme: DSnackBarTheme.darkSnackBarTheme,
    switchTheme: DSwitchTheme.darkSwitchTheme,
    // tooltipTheme: ,
  );
}