// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/learning/build_video_player.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../modules/providers/theme_provider.dart';
import '../../../../../utils/theme/typography.dart';

class PTraining2 extends ConsumerWidget {
  const PTraining2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Learning: Punching'),
      body: Column(
        children: [
          BuildVideoPlayer(
              demoVidUrl:
                  'https://firebasestorage.googleapis.com/v0/b/initvideodatabase.appspot.com/o/trueDemoVid%2FCross.mp4?alt=media&token=c28a7fef-418f-4e73-9018-2dbc1462d941'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Cross",
                textAlign: TextAlign.left,
                style: themeState.isDarkModeEnabled
                    ? DTypography.defStydarkTrainingName
                    : DTypography.defStylightTrainingName,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "The Cross is a powerful straight punch delivered with the rear hand. It is often used to follow up a Jab, creating a one-two combination that can overwhelm the opponent. The Cross targets the opponent's face or upper body and is a core offensive technique in Krav Maga.",
                textAlign: TextAlign.justify,
                style: themeState.isDarkModeEnabled
                    ? DTypography.defStydarkTrainingDesc
                    : DTypography.defStylightTrainingDesc,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
