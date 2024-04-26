// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarHeaderMonth extends ConsumerWidget {
  const CalendarHeaderMonth({
    super.key,
    required this.headerWidth,
    required String? headerText,
  }) : _headerText = headerText;

  final double? headerWidth;
  final String? _headerText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: headerWidth,
        child: Text(
          _headerText!,
          textAlign: TextAlign.center,
          style: themeState.isDarkModeEnabled
              ? DTypography.defStydarkCalendarMonth
              : DTypography.defStylightCalendarMonth,
        ),
      ),
    );
  }
}
