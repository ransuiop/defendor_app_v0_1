// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class DDialogTheme {
  DDialogTheme._(); 

  static DialogTheme lightDialogTheme = DialogTheme(
    actionsPadding: EdgeInsets.all(2.0),
    alignment: Alignment.center,
    backgroundColor: defXWht,
    contentTextStyle: DTypography.defStylightDialogContent,
    elevation: 5,
    iconColor: defDBlu,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16))
    ),
    titleTextStyle: DTypography.defStylightDialogTitle,
  );

  static DialogTheme darkDialogTheme = DialogTheme(
    actionsPadding: EdgeInsets.all(2.0),
    alignment: Alignment.center,
    backgroundColor: defLBlu,
    contentTextStyle: DTypography.defStydarkDialogContent,
    elevation: 5,
    iconColor: defXWht,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16))
    ),
    titleTextStyle: DTypography.defStydarkDialogTitle,
  );
}