// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../modules/providers/theme_provider.dart';
import '../../../../utils/widgets/omni/omni_app_bar.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/theme/typography.dart';

class LearningKickTab extends ConsumerWidget {
  const LearningKickTab({super.key});

  static List kickTechniques = ['/kt1', '/kt2'];
  static List kickTechniquesName = ['L. GROIN KICK', 'R. GROIN KICK'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Scaffold(
      appBar: DOmniAppBar(tabName: "Kicking"),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: kickTechniques.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, kickTechniques[index]),
            child: Container(
              height: 140,
              width: 340,
              decoration: BoxDecoration(
                color: themeState.isDarkModeEnabled ? defWht : defDBlu,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  kickTechniquesName[index],
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCategoriesName
                      : DTypography.defStylightCategoriesName,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
