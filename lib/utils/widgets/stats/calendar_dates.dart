// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/widgets/stats/calendar_header_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/typography.dart';

class CalendarDates extends ConsumerWidget {
  const CalendarDates({
    super.key,
    required this.cellWidth,
    required this.sunClr,
    required String? dateText,
    required this.monClr,
    required String? dateText1,
    required this.tueClr,
    required String? dateText2,
    required this.wedClr,
    required String? dateText3,
    required this.thuClr,
    required String? dateText4,
    required this.friClr,
    required String? dateText5,
    required this.satClr,
    required String? dateText6,
  })  : _dateText = dateText,
        _dateText1 = dateText1,
        _dateText2 = dateText2,
        _dateText3 = dateText3,
        _dateText4 = dateText4,
        _dateText5 = dateText5,
        _dateText6 = dateText6;

  final double? cellWidth;
  final Color? sunClr;
  final String? _dateText;
  final Color? monClr;
  final String? _dateText1;
  final Color? tueClr;
  final String? _dateText2;
  final Color? wedClr;
  final String? _dateText3;
  final Color? thuClr;
  final String? _dateText4;
  final Color? friClr;
  final String? _dateText5;
  final Color? satClr;
  final String? _dateText6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Padding(
      padding: EdgeInsets.only(left: reqLeftPadding, right: reqLeftPadding),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: sunClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: monClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText1  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: tueClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText2  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: wedClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText3  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: thuClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText4  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: friClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText5  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Container(
              width: cellWidth,
              height: cellWidth,
              decoration: BoxDecoration(
                color: satClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _dateText6  ?? '',
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCalendarDates
                      : DTypography.defStylightCalendarDates,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
