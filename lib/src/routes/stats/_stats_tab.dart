// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../utils/widgets/stats/calendar_dates.dart';
import '../../../utils/widgets/stats/calendar_days.dart';
import '../../../utils/widgets/stats/calendar_header_month.dart';
import '../../../utils/widgets/stats/progress_chart.dart';

class StatsTab extends ConsumerStatefulWidget {
  const StatsTab({super.key});

  @override
  ConsumerState<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends ConsumerState<StatsTab> {
  final CalendarController _calendarController = CalendarController();
  String? _headerText,
      _viewHeaderText,
      _viewHeaderText1,
      _viewHeaderText2,
      _viewHeaderText3,
      _viewHeaderText4,
      _viewHeaderText5,
      _viewHeaderText6,
      _dateText,
      _dateText1,
      _dateText2,
      _dateText3,
      _dateText4,
      _dateText5,
      _dateText6;
  String? date;
  double? headerWidth, cellWidth;
  Icon? icon1, icon2, icon3, icon4, icon5, icon6, icon7;
  DateTime dateToday = DateTime.now();
  DateFormat formatter = DateFormat('EEE');

  @override
  Widget build(BuildContext context) {
    final themeState = ref.read(appThemeStateNotifier);

    headerWidth = 100;
    cellWidth = 40;

    Color sunClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color monClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color tueClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color wedClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color thuClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color friClr = themeState.isDarkModeEnabled ? defGry : defDBlu;
    Color satClr = themeState.isDarkModeEnabled ? defGry : defDBlu;

    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Statistics'),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Calendar',
                    style: themeState.isDarkModeEnabled
                        ? DTypography.defStydarkCalendarLabel
                        : DTypography.defStylightCalendarLabel,
                  ),
                  // CUSTOMIZED VIEW OF THE HEADER (THE MONTH)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ext_cal');
                    },
                    child: CalendarHeaderMonth(
                      headerWidth: headerWidth,
                      headerText: _headerText,
                    ),
                  ),
                  // CUSTOMIZED VIEW OF THE DAYS (CHILDREN ON ROW)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ext_cal');
                    },
                    child: CalendarDays(
                        cellWidth: cellWidth,
                        viewHeaderText: _viewHeaderText,
                        viewHeaderText1: _viewHeaderText1,
                        viewHeaderText2: _viewHeaderText2,
                        viewHeaderText3: _viewHeaderText3,
                        viewHeaderText4: _viewHeaderText4,
                        viewHeaderText5: _viewHeaderText5,
                        viewHeaderText6: _viewHeaderText6),
                  ),
                  // CUSTOMIZED VIEW OF THE DATES (CHILDREN ON ROW)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ext_cal');
                    },
                    child: CalendarDates(
                      cellWidth: cellWidth,
                      sunClr: sunClr,
                      dateText: _dateText,
                      monClr: monClr,
                      dateText1: _dateText1,
                      tueClr: tueClr,
                      dateText2: _dateText2,
                      wedClr: wedClr,
                      dateText3: _dateText3,
                      thuClr: thuClr,
                      dateText4: _dateText4,
                      friClr: friClr,
                      dateText5: _dateText5,
                      satClr: satClr,
                      dateText6: _dateText6,
                    ),
                  ),
                  Stack(
                    children: [
                      SfCalendar(
                        backgroundColor:
                            themeState.isDarkModeEnabled ? defDBlu : defWht,
                        cellBorderColor:
                            themeState.isDarkModeEnabled ? defDBlu : defWht,
                        headerHeight: 0,
                        viewHeaderHeight: 0,
                        timeSlotViewSettings: TimeSlotViewSettings(
                          timeIntervalHeight: 0,
                          timeRulerSize: 0,
                        ),
                        controller: _calendarController,
                        view: CalendarView.week,
                        onViewChanged: (viewChangedDetails) {
                          if (_calendarController.view == CalendarView.week) {
                            _headerText = DateFormat('MMMM')
                                .format(viewChangedDetails.visibleDates[
                                    viewChangedDetails.visibleDates.length ~/
                                        2])
                                .toString();
                            _viewHeaderText = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[0])
                                .toString().substring(0, 1);
                            _viewHeaderText1 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[1])
                                .toString().substring(0, 1);
                            _viewHeaderText2 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[2])
                                .toString().substring(0, 1);
                            _viewHeaderText3 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[3])
                                .toString().substring(0, 1);
                            _viewHeaderText4 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[4])
                                .toString().substring(0, 2);
                            _viewHeaderText5 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[5])
                                .toString().substring(0, 1);
                            _viewHeaderText6 = DateFormat('EEE')
                                .format(viewChangedDetails.visibleDates[6])
                                .toString().substring(0, 2);
                            _dateText = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[0])
                                .toString();
                            _dateText1 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[1])
                                .toString();
                            _dateText2 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[2])
                                .toString();
                            _dateText3 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[3])
                                .toString();
                            _dateText4 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[4])
                                .toString();
                            _dateText5 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[5])
                                .toString();
                            _dateText6 = DateFormat('dd')
                                .format(viewChangedDetails.visibleDates[6])
                                .toString();
                            if (viewChangedDetails.visibleDates[0].day ==
                                DateTime.now().day) {
                              sunClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[1].day ==
                                DateTime.now().day) {
                              monClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[2].day ==
                                DateTime.now().day) {
                              tueClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[3].day ==
                                DateTime.now().day) {
                              wedClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[4].day ==
                                DateTime.now().day) {
                              thuClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[5].day ==
                                DateTime.now().day) {
                              friClr = defLBlu;
                            }
                            if (viewChangedDetails.visibleDates[6].day ==
                                DateTime.now().day) {
                              satClr = defLBlu;
                            }
                          }
                        },
                      ),
                      ProgressChart(),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 185),
                        child: Text(
                          formatter.format(dateToday).toUpperCase(),
                          style: themeState.isDarkModeEnabled
                              ? DTypography.defStydarkWeekday
                              : DTypography.defStylightWeekday,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
