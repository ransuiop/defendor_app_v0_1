// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// STRINGs
String appName = "Defendor";
String lipsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut '
    'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip '
    'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat '
    'nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit';

// '${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} ${timeOfDay.period.toString().toUpperCase().substring(10)}';

// INTs & DOUBLEs / SIZEs
double reqDivider = 8;
double reqLeftPadding = (92.85 - (reqDivider * 6)) / 2;

Size childrenButtonSize = Size(64, 64);


// TIME
TimeOfDay defaultSetDailyTime = TimeOfDay(hour: 12, minute: 0);

// FUNCs & CLASSes
class SnackTime {
  SnackTime._();
  static buildNotifSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

twelveHourFormat(TimeOfDay timeOfDay) {
  return '${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} ${timeOfDay.period.toString().toUpperCase().substring(10)}';
}

// COLORs
Color defDBlu = Color(0xFF031F4B);
Color defLBlu = Color(0xFF161D6F);
Color defGry = Color(0xFFC5C5C5);
Color defXWht = Color(0xFFF6F6F6);
Color defWht = Colors.white;
Color defBBlu = Colors.blue;