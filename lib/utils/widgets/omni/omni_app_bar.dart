// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/providers/theme_provider.dart';

class DOmniAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DOmniAppBar({super.key, required this.tabName});
  final String tabName;

  @override
  Size get preferredSize => Size.fromHeight(85);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return AppBar(
      foregroundColor: defWht,
      title: Row(
        children: [
          Text(
            "[LOGO]",
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: SizedBox(
          child: Container(
            color: Theme.of(context).bottomAppBarTheme.color,
            alignment: Alignment.center,
            child: Text(
              tabName,
              textAlign: TextAlign.center,
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkBottomAppBar
                  : DTypography.defStylightBottomAppBar,
            ),
          ),
        ),
      ),
    );
  }
}
