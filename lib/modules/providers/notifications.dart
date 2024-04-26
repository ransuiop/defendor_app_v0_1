// ignore_for_file: prefer_const_constructors

import 'package:awesome_notifications/awesome_notifications.dart';

import '../services/notification_service.dart';

// use parameter [repeats: true] for daily/timely reminders

Future<void> createTestNotification() async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 0,
    channelKey: 'daily_rem_channel',
    category: NotificationCategory.Reminder,
    title: 'Hey! 👋',
    body: '📶 This is just a test notification! 🤔',
  ));
}
Future<void> createDailyReminderNotification() async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 1,
    channelKey: 'daily_rem_channel',
    category: NotificationCategory.Reminder,
    title: 'Hey! 👋',
    body: '📶 This is just a test reminder! 🤔',
    notificationLayout: NotificationLayout.BigPicture,
    bigPicture: 'asset://assets/images/brainstorm.png',
  ));
}

Future<void> createCustomDailyReminderNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'daily_rem_channel',
      category: NotificationCategory.Reminder,
      title: 'Hey, past me!',
      body: '👨‍🦽 This is your custom-made daily reminder!',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'OPEN',
        label: 'Open Defendor',
      ),
      NotificationActionButton(
        key: 'STOP',
        label: 'Stop reminding',
      ),
    ],
    schedule: NotificationCalendar(
      weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
    ),
  );
}

Future<void> createScheduledPracticeReminderNotification(
    NotificationWeekAndTime notificationSchedule, int randomID) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: randomID,
      channelKey: 'scheduled_rem_channel',
      category: NotificationCategory.Reminder,
      title: 'Reminding you!',
      body: '🫠 Custom-made practice reminder! (non-repeating)',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'OPEN',
        label: 'Open Defendor',
      ),
      NotificationActionButton(
        key: 'STOP',
        label: 'Stop reminding',
      ),
    ],
    schedule: NotificationCalendar(
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
    ),
  );
}
