// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants.dart';

class CalendarHeaderDivider extends StatelessWidget {
  const CalendarHeaderDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: reqDivider,
    );
  }
}
