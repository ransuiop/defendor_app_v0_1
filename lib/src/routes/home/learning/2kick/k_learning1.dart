// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/learning/build_video_player.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../modules/providers/theme_provider.dart';
import '../../../../../utils/theme/typography.dart';

class KTraining1 extends ConsumerWidget {
  const KTraining1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Learning: Kicking'),
      body: Column(
        children: [
          BuildVideoPlayer(
              demoVidUrl:
                  'https://firebasestorage.googleapis.com/v0/b/initvideodatabase.appspot.com/o/trueDemoVid%2FGroinKickLeft.mp4?alt=media&token=37d1c3b0-7d3a-4338-9bea-882b15154f14'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Left Groin Kick",
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
                "The Left Groin Kick is a low, forceful kick delivered with the lead leg, targeting the opponent's groin area. This technique is designed to incapacitate the opponent quickly and is a key self-defense move in Krav Maga, as it aims to neutralize threats in a vulnerable area.",
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
