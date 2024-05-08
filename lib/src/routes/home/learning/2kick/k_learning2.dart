// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/learning/build_video_player.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../modules/providers/theme_provider.dart';
import '../../../../../utils/theme/typography.dart';

class KTraining2 extends ConsumerWidget {
  const KTraining2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Learning: Kicking'),
      body: Column(
        children: [
          BuildVideoPlayer(
              demoVidUrl:
                  'https://firebasestorage.googleapis.com/v0/b/initvideodatabase.appspot.com/o/trueDemoVid%2FGroinKickRight.mp4?alt=media&token=b04bc7be-8a82-42cf-89ab-6baf00014608'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Right Groin Kick",
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
                "The Right Groin Kick is similar to the Left Groin Kick, but delivered with the rear leg. It also targets the opponent's groin area and is another effective self-defense technique in Krav Maga.",
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
