// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// TODO: book sett CHANGE VALUES AND HEADERS (+ STYLES AND FORMATTING)
import 'package:defendor_app_v0_1/utils/widgets/settings/sett_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/typography.dart';

class BookSett extends StatelessWidget {
  const BookSett({super.key});

  static List genSections = ["Display", "Accessibility", "Preferences"];
  static List genTileIcons = [
    [Icon(Icons.palette)],
    [Icon(Icons.remove_red_eye)],
    [Icon(Icons.home), Icon(Icons.campaign)],
  ];
  static List genTileTitles = [
    ["Theme"],
    ["Colorblind mode"],
    ["Default tab", "Feedback and corrections"]
  ];
  static List genTileSubtitles = [
    ["<value>"],
    ["<value>"],
    ["<value>", "<value>"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DSettAppBar(tabName: "Bookmarks"),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: genSections.length,
                  itemBuilder: ((context, sectionI) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Column(
                        children: [
                          Theme(
                            data: ThemeData(),
                            child: ListTile(
                              title: Text(
                                genSections[sectionI],
                                textAlign: TextAlign.left,
                                style: DTypography.defStySettSection,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: genTileIcons[sectionI].length,
                            itemBuilder: ((context, deetsI) {
                              return ListTile(
                                leading: genTileIcons[sectionI][deetsI],
                                title: Text(
                                  genTileTitles[sectionI][deetsI],
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  genTileSubtitles[sectionI][deetsI],
                                  textAlign: TextAlign.left,
                                ),
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
