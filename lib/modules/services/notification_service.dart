// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

import '../controllers/notification_controller.dart';

class NotificationService {
  static Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelGroupKey: 'alerts_group',
        channelKey: 'update_ale_channel',
        channelName: 'Updates',
        channelDescription: 'Alerts for available updates',
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        criticalAlerts: true,
      ), // defaultColor: COLOR HERE
      NotificationChannel(
        channelGroupKey: 'alerts_group',
        channelKey: 'lapse_ale_channel',
        channelName: 'Lapses',
        channelDescription: 'Alerts about neglected or "lapsed" training',
        importance: NotificationImportance.Max,
        channelShowBadge: true,
      ), // defaultColor: COLOR HERE
      NotificationChannel(
        channelGroupKey: 'reminders_group',
        channelKey: 'daily_rem_channel',
        channelName: 'Daily Reminders',
        channelDescription: 'Pre-programmed daily reminders',
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelGroupKey: 'reminders_group',
        channelKey: 'standard_rem_channel',
        channelName: 'Reminders',
        channelDescription:
            'Detects when you might miss practice and reminds you',
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelGroupKey: 'reminders_group',
        channelKey: 'scheduled_rem_channel',
        channelName: 'Scheduled Reminders',
        channelDescription: 'User-scheduled notifications/reminders',
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelGroupKey: 'reminders_group',
        channelKey: 'time_rem_channel',
        channelName: 'Time Reminders',
        channelDescription: 'Specifically, reminders but with time',
        importance: NotificationImportance.High,
      ),
    ], channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'alerts_group', channelGroupName: 'Alerts'),
      NotificationChannelGroup(
          channelGroupKey: 'reminders_group', channelGroupName: 'Reminders'),
    ]);

    // for asking notifications permissions
    bool isAllowedToSendNotifications =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowedToSendNotifications) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }
}

//
// weekday and time model for notification usage
//
class NotificationWeekAndTime {
  int? dayOfTheWeek;
  TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

class NotificationUtil {
//
// displays time picker for REPLACING
// the default daily reminder time of 12PM (noon)
// to a new time, picked by user
//
  static Future<NotificationWeekAndTime?> pickDailySchedule(
    BuildContext context,
  ) async {
    List<String> weekdays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    TimeOfDay? timeOfDay;
    DateTime now = DateTime.now();
    int? selectedDay;

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'I want to be reminded every:',
              textAlign: TextAlign.center,
            ),
            content: Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                for (int index = 0; index < weekdays.length; index++)
                  ElevatedButton(
                    onPressed: () {
                      selectedDay = index + 1;
                      Navigator.pop(context);
                    },
                    child: Text(weekdays[index]),
                  ),
              ],
            ),
          );
        });

    if (selectedDay != null) {
      timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(now.add(Duration(minutes: 1))),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData(
                colorScheme:
                    ColorScheme.light(primary: defBBlu, secondary: defBBlu),
              ),
              child: child!,
            );
          });

      if (timeOfDay != null) {
        return NotificationWeekAndTime(
            dayOfTheWeek: selectedDay, timeOfDay: timeOfDay);
      }
    }
    return null;
  }

//
// displays time picker for CREATING new practice reminders.
// this scheduled notification is displays at only one time
//
  static Future<NotificationWeekAndTime?> pickTimedSchedule(
    BuildContext context,
  ) async {
    TimeOfDay? timeOfDay;
    DateTime now = DateTime.now();

    timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(now.add(Duration(minutes: 1))),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme:
                  ColorScheme.light(primary: defBBlu, secondary: defBBlu),
            ),
            child: child!,
          );
        });

    if (timeOfDay != null) {
      return NotificationWeekAndTime(timeOfDay: timeOfDay);
    }
    return null;
  }

  static Future<void> cancelSchedule(id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static Future<void> cancelAllScheduledPracReminders() async {
    await AwesomeNotifications()
        .cancelNotificationsByChannelKey('scheduled_rem_channel');
  }
}
