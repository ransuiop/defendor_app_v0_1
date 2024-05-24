// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/utils/widgets/settings/sett_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/typography.dart';

class NotifSett extends StatelessWidget {
  const NotifSett({super.key});

  static List notifSections = ["<placeSection>", "<placeSection>", "<placeSection>"];
  static List notifTileIcons = [
    [Icon(Icons.notifications_active)],
    [Icon(Icons.remove_red_eye)],
    [Icon(Icons.home)]
  ];
  static List notifTileTitles = [
    ["<placeSection>"],
    ["<placeTitle>"],
    ["<placeTitle>"]
  ];
  static List notifTileSubtitles = [
    ["<placeSection>"],
    ["<placeSection>"],
    ["<value>"]
  ];
  static List notifSettRoutes = [
    ['placeholder'],
    ['place'],
    ['holder']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DSettAppBar(tabName: "Notifications"),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notifSections.length,
                  itemBuilder: ((context, sectionI) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Column(
                        children: [
                          Theme(
                            data: ThemeData(),
                            child: ListTile(
                              title: Text(
                                notifSections[sectionI],
                                textAlign: TextAlign.left,
                                style: DTypography.defStySettSection,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: notifTileIcons[sectionI].length,
                            itemBuilder: ((context, deetsI) {
                              return ListTile(
                                leading: notifTileIcons[sectionI][deetsI],
                                title: Text(
                                  notifTileTitles[sectionI][deetsI],
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  notifTileSubtitles[sectionI][deetsI],
                                  textAlign: TextAlign.left,
                                ),
                                onTap: () => Navigator.pushNamed(
                                    context, notifSettRoutes[sectionI][deetsI]),
                              );
                            }),
                          )
                        ],
                      ),
                    );
                  }),
                ))));
  }
}
