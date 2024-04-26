// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/learning/build_training_tab.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme/typography.dart';

class PTraining2 extends StatelessWidget {
  const PTraining2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DOmniAppBar(tabName: 'Learning: Punching'),
      body: Column(
        children: [
          BuildTrainingTab(
              demoVidUrl:
                  'https://firebasestorage.googleapis.com/v0/b/initvideodatabase.appspot.com/o/demoVid%2Flegends.mp4?alt=media&token=bb358a24-3000-4ec0-8543-a37b40dd3446'),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Training Name",
                textAlign: TextAlign.left,
                style: DTypography.defStylightTrainingName,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                lipsumText,
                textAlign: TextAlign.justify,
                style: DTypography.defStylightTrainingDesc,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
