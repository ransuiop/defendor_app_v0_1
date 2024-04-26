// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customSetDailyTimeProvider =
    NotifierProvider<CustomSetDailyTimeNotifier, TimeOfDay>(
        CustomSetDailyTimeNotifier.new);

class CustomSetDailyTimeNotifier extends Notifier<TimeOfDay> {
  @override
  TimeOfDay build() {
    TimeOfDay customSetDailyTime = TimeOfDay(hour: 12, minute: 0);
    return customSetDailyTime;
  }

  replaceSetDailyTime(hourReplacing, minuteReplacing) {
    state = TimeOfDay(hour: hourReplacing, minute: minuteReplacing);
  }
}

final customSetDailyTimeTextProvider = Provider<String>((ref) {
  TimeOfDay theCustomSetDailyTime = ref.watch(customSetDailyTimeProvider);
  return '${theCustomSetDailyTime.hourOfPeriod}:${theCustomSetDailyTime.minute.toString().padLeft(2, '0')} ${theCustomSetDailyTime.period.toString().toUpperCase().substring(10)}';
});

final ableSetDailyTimeBoolProvider =
    NotifierProvider<AbleSetDailyTimeBoolNotifier, bool>(
        AbleSetDailyTimeBoolNotifier.new);

class AbleSetDailyTimeBoolNotifier extends Notifier<bool> {
  @override
  bool build() {
    bool dailyRemValue = true;
    return dailyRemValue;
  }

  change() {
    if (state == false) {
      state = true;
    } else {
      state = false;
    }
  }
}

final customSetDailyTimeColorProvider = Provider<Color>((ref) {
  if (ref.watch(ableSetDailyTimeBoolProvider) == true &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == true) {
    return Colors.grey.shade400;
  }
  if (ref.watch(ableSetDailyTimeBoolProvider) == true &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == false) {
    return Colors.grey.shade600;
  }
  if (ref.watch(ableSetDailyTimeBoolProvider) == false &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == true) {
    return Colors.blue;
  } else {
    return Colors.blue;
  }
});

final customSetDailyTimeTileColorProvider = Provider<Color>((ref) {
  if (ref.watch(ableSetDailyTimeBoolProvider) == true &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == true) {
    return Colors.grey.shade400;
  }
  if (ref.watch(ableSetDailyTimeBoolProvider) == true &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == false) {
    return Colors.grey.shade600;
  }
  if (ref.watch(ableSetDailyTimeBoolProvider) == false &&
      ref.read(appThemeStateNotifier).isDarkModeEnabled == true) {
    return defWht;
  } else {
    return defDBlu;
  }
});
