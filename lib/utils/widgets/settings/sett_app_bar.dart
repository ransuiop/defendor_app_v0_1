// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class DSettAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DSettAppBar({super.key, required this.tabName});
  final String tabName;

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(backgroundColor: defDBlu)),
        child: AppBar(
          elevation: 4,
          centerTitle: true,
          title: Text(
            tabName,
            style: DTypography.defStySettAppBar,
          ),
          foregroundColor: defWht,
        ));
  }
}
