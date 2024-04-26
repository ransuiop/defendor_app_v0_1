// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/widgets/stats/calendar_header_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/typography.dart';

class CalendarDays extends ConsumerWidget {
  const CalendarDays({
    super.key,
    required this.cellWidth,
    required String? viewHeaderText,
    required String? viewHeaderText1,
    required String? viewHeaderText2,
    required String? viewHeaderText3,
    required String? viewHeaderText4,
    required String? viewHeaderText5,
    required String? viewHeaderText6,
  })  : _viewHeaderText = viewHeaderText,
        _viewHeaderText1 = viewHeaderText1,
        _viewHeaderText2 = viewHeaderText2,
        _viewHeaderText3 = viewHeaderText3,
        _viewHeaderText4 = viewHeaderText4,
        _viewHeaderText5 = viewHeaderText5,
        _viewHeaderText6 = viewHeaderText6;

  final double? cellWidth;
  final String? _viewHeaderText;
  final String? _viewHeaderText1;
  final String? _viewHeaderText2;
  final String? _viewHeaderText3;
  final String? _viewHeaderText4;
  final String? _viewHeaderText5;
  final String? _viewHeaderText6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Padding(
      padding: EdgeInsets.only(left: reqLeftPadding, right: reqLeftPadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _viewHeaderText!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText1!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText2!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText3!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText4!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText5!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
          CalendarHeaderDivider(),
          Expanded(
            child: Text(
              _viewHeaderText6!,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkCalendarDays
                  : DTypography.defStylightCalendarDays,
            ),
          ),
        ],
      ),
    );
  }
}
