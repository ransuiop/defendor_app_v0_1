// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer' as doop;
import 'dart:math';

import 'package:defendor_app_v0_1/modules/providers/custom_set_daily_time_provider.dart';
import 'package:defendor_app_v0_1/modules/providers/notifications.dart';
import 'package:defendor_app_v0_1/modules/services/notification_service.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/settings/sett_app_bar.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../modules/providers/theme_provider.dart';

class NotifRemSett extends ConsumerStatefulWidget {
  const NotifRemSett({super.key});

  @override
  ConsumerState<NotifRemSett> createState() => _NotifRemSettState();
}

class _NotifRemSettState extends ConsumerState<NotifRemSett> {
  bool initPracRemValue = true;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.read(appThemeStateNotifier);

    return Scaffold(
      appBar: DSettAppBar(tabName: "Reminders"),
      floatingActionButton: SpeedDial(
        backgroundColor: defBBlu,
        foregroundColor: Colors.black,
        icon: Icons.menu,
        activeIcon: Icons.close,
        overlayOpacity: 0.5,
        overlayColor: Colors.black,
        childrenButtonSize: childrenButtonSize,
        children: [
          SpeedDialChild(
            child: Icon(Icons.delete_forever),
            label: 'Clear all',
            shape: CircleBorder(),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Confirmation',
                        style: themeState.isDarkModeEnabled
                            ? DTypography.defStydarkDialogTitle
                            : DTypography.defStylightDialogTitle,
                      ),
                      content: RichText(
                          text: TextSpan(
                        text: 'Do you want to clear ',
                        children: [
                          TextSpan(text: 'ALL '),
                          TextSpan(text: 'scheduled practice reminders?')
                        ],
                        style: themeState.isDarkModeEnabled
                            ? DTypography.defStydarkDialogContent
                            : DTypography.defStylightDialogContent,
                      )),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            NotificationUtil.cancelAllScheduledPracReminders();
                            Navigator.of(context).pop();
                            SnackTime.buildNotifSnackbar(context,
                                'Cleared ALL scheduled practice reminders');
                          },
                          child: Text(
                            'CLEAR',
                            style: TextStyle(
                              color: defBBlu,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: defBBlu,
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.edit_notifications),
            label: 'Test notification',
            shape: CircleBorder(),
            onTap: () => createTestNotification(),
          ),
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: Column(
                    children: [
                      SwitchListTile(
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        title: Text(
                          "Daily reminders",
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          "Standard daily reminders. Sometimes encouraging. Reminds at 12NN.",
                          textAlign: TextAlign.left,
                        ),
                        value: ref.watch(ableSetDailyTimeBoolProvider),
                        onChanged: (value) {
                          setState(() {
                            ref
                                .watch(ableSetDailyTimeBoolProvider.notifier)
                                .change();
                            if (ref.watch(ableSetDailyTimeBoolProvider) ==
                                true) {
                              NotificationUtil.cancelSchedule(2);
                              ref
                                  .watch(customSetDailyTimeProvider.notifier)
                                  .replaceSetDailyTime(12, 0);
                            }
                          });
                          doop.log('${ref.watch(ableSetDailyTimeBoolProvider)}');
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        title: Text(
                          "Customize daily reminders",
                          style:
                              defStyNullableTileTitle(),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          "You may set-up more than one daily reminder at different times.",
                          style: defStyNullableTileSubtitle(),
                          textAlign: TextAlign.left,
                        ),
                        trailing: GestureDetector(
                          child: Text(
                            ref.watch(customSetDailyTimeTextProvider),
                            style: defStyNullableTileTime(),
                          ),
                          onTap: () async {
                            if (ref.watch(ableSetDailyTimeBoolProvider) ==
                                false) {
                              NotificationWeekAndTime? pickedDailySchedule =
                                  await NotificationUtil.pickDailySchedule(
                                      context);

                              if (pickedDailySchedule != null) {
                                createCustomDailyReminderNotification(
                                    pickedDailySchedule);
                                ref
                                    .watch(customSetDailyTimeProvider.notifier)
                                    .replaceSetDailyTime(
                                        pickedDailySchedule.timeOfDay.hour,
                                        pickedDailySchedule.timeOfDay.minute);
                                // ignore: use_build_context_synchronously
                                SnackTime.buildNotifSnackbar(context,
                                    'New daily reminder set up at ${ref.watch(customSetDailyTimeTextProvider)}!');
                              }
                            } else {}
                          },
                        ),
                        enabled: ref.watch(ableSetDailyTimeBoolProvider),
                      ),
                      // TODO: REMINDER SYSTEM
                      SwitchListTile(
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        title: Text(
                          "Practice reminders",
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          "Detects times when you might miss your selected practice quota and reminds you.",
                          textAlign: TextAlign.left,
                        ),
                        value: initPracRemValue,
                        onChanged: (value) {
                          setState(() {
                            initPracRemValue = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () async {
                            NotificationWeekAndTime? pickedTimedSchedule =
                                await NotificationUtil.pickTimedSchedule(
                                    context);

                            if (pickedTimedSchedule != null) {
                              createScheduledPracticeReminderNotification(
                                  pickedTimedSchedule,
                                  Random().nextInt(50) + 50);
                              // ignore: use_build_context_synchronously
                              SnackTime.buildNotifSnackbar(context,
                                  'Custom practice reminder for ${twelveHourFormat(pickedTimedSchedule.timeOfDay)} has been added!');
                            }
                          },
                          child: Text(
                            'Schedule a practice reminder',
                            style: themeState.isDarkModeEnabled
                                ? DTypography.defStydarkButtonText
                                : DTypography.defStylightButtonText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  TextStyle defStyNullableTileTime() {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.normal,
      color: ref.watch(customSetDailyTimeColorProvider),
    );
  }

  TextStyle defStyNullableTileTitle() {
    return TextStyle(
      fontSize: 18,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.bold,
      color: ref.watch(customSetDailyTimeTileColorProvider),
    );
  }

  TextStyle defStyNullableTileSubtitle() {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w200,
      color: ref.watch(customSetDailyTimeTileColorProvider),
    );
  }
}
