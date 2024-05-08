// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/learning/build_video_player.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../modules/providers/theme_provider.dart';
import '../../../../../utils/theme/typography.dart';

class CTraining1 extends ConsumerWidget {
  const CTraining1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Learning: Chopping'),
      body: Column(
        children: [
          BuildVideoPlayer(
              demoVidUrl:
                  'https://firebasestorage.googleapis.com/v0/b/initvideodatabase.appspot.com/o/trueDemoVid%2FChopLeft.mp4?alt=media&token=fe5c9010-052f-493c-8c95-0a7fdb6fe8f1'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Left Chop",
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
                "The Left Chop is a powerful, downward strike with the edge of the hand, targeting the opponent's neck or collarbone area. This technique is used to stun or disable the opponent, and is a crucial part of Krav Maga's emphasis on rapid, decisive strikes.",
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
