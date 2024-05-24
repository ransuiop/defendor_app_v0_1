// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/settings/sett_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenSett extends ConsumerStatefulWidget {
  const GenSett({super.key});

  @override
  ConsumerState<GenSett> createState() => _GenSettState();
}

class _GenSettState extends ConsumerState<GenSett> {
  static List genSections = ["Display", "Accessibility", "Preferences"];
  static List genTileIcons = [
    [Icon(Icons.palette), ""],
    [Icon(Icons.remove_red_eye)],
    [Icon(Icons.home), Icon(Icons.campaign)],
  ];
  static List genTileTitles = [
    ["Theme", ""],
    ["<placeHolder>"],
    ["<placeHolder>", "<placeHolder>"]
  ];
  static List genTileSubtitles = [
    ["", ""],
    ["<value>"],
    ["<value>", "<value>"]
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = ref.read(appThemeStateNotifier);

    return Scaffold(
        appBar: DSettAppBar(tabName: "General"),
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
                            itemCount:
                                genTileIcons[sectionI].length, //PROBLEM SOLVED
                            itemBuilder: ((context, deetsI) {
                              if (sectionI == 0 && deetsI == 1) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/previewLightTheme.png',
                                            alignment: Alignment.center,
                                            height: 150,
                                            width: 150,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              'Light',
                                              style: themeState
                                                      .isDarkModeEnabled
                                                  ? DTypography
                                                      .defStydarkSettTilesTitle
                                                  : DTypography
                                                      .defStylightSettTilesTitle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Switch(
                                          value: themeState.isDarkModeEnabled,
                                          onChanged: (enabled) {
                                            if (enabled) {
                                              themeState.setDarkTheme();
                                            } else {
                                              themeState.setLightTheme();
                                            }
                                          },
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/previewDarkTheme.png',
                                            alignment: Alignment.center,
                                            height: 150,
                                            width: 150,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              'Dark',
                                              style: themeState
                                                      .isDarkModeEnabled
                                                  ? DTypography
                                                      .defStydarkSettTilesTitle
                                                  : DTypography
                                                      .defStylightSettTilesTitle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
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
                                // onTap: showRadioDialog(),
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
