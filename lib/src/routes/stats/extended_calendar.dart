// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ExtendedCalendar extends StatelessWidget {
  const ExtendedCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Calendar'),
      body: SfCalendar(
        view: CalendarView.month,
        headerStyle: CalendarHeaderStyle(
          backgroundColor: defWht,
          textAlign: TextAlign.center,
          textStyle: DTypography.defStyExtCal,
        ),
      ),
    );
  }
}
