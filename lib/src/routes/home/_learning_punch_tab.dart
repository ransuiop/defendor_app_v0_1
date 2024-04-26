// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';

class LearningPunchTab extends StatelessWidget {
  const LearningPunchTab({super.key});

  static List punchTechniques = ['/pt1', '/pt2', '/pt3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DOmniAppBar(tabName: "Punching"),
      body: ListView.separated(
        padding:
            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: punchTechniques.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, punchTechniques[index]),
            child: Container(
                height: 140,
                width: 340,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: defDBlu,
                  borderRadius: BorderRadius.circular(20),
                )),
          );
        },
      ),
    );
  }
}
