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
    ["Colorblind mode"],
    ["Default tab", "Feedback and corrections"]
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
                )

                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 14.0),
                //       child: Column(
                //         children: [
                //           ListTile(
                //             title: Text(
                //               "Display",
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.blue,
                //               ),
                //             ),
                //           ),
                //           ListTile(
                //             contentPadding: EdgeInsets.only(left: 20),
                //             leading: Icon(
                //               Icons.palette,
                //               size: 26,
                //               color: Colors.white,
                //             ),
                //             title: Text(
                //               "Theme",
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontFamily: 'Metropolis',
                //                 fontWeight: FontWeight.normal,
                //                 color: Colors.white,
                //               ),
                //               textAlign: TextAlign.left,
                //             ),
                //           ),

                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 14.0),
                //       child: Column(
                //         children: [
                //           ListTile(
                //             title: Text(
                //               "Accessibility",
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.blue,
                //               ),
                //             ),
                //           ),
                //           ListTile(
                //             contentPadding: EdgeInsets.only(left: 20),
                //             leading: Icon(
                //               Icons.remove_red_eye,
                //               size: 26,
                //               color: Colors.white,
                //             ),
                //             title: Text(
                //               "Colorblind mode",
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontFamily: 'Metropolis',
                //                 fontWeight: FontWeight.normal,
                //                 color: Colors.white,
                //               ),
                //               textAlign: TextAlign.left,
                //             ),
                //             subtitle: Text(
                //               "placeholder <value>",
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontFamily: 'Metropolis',
                //                 fontWeight: FontWeight.w200,
                //                 color: Colors.white,
                //               ),
                //               textAlign: TextAlign.left,
                //             ),
                //             onTap: () {},
                //           ),
                //           ListTile(
                //             contentPadding: EdgeInsets.only(left: 20),
                //             leading: Icon(
                // Icons.text_fields,
                //               size: 26,
                //               color: Colors.white,
                //             ),
                //     Column(
                //       children: [
                //         ListTile(
                //           title: Text(
                //             "Preferences",
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.blue,
                //             ),
                //           ),
                //         ),
                //         ListTile(
                //           contentPadding: EdgeInsets.only(left: 20),
                //           leading: Icon(
                //             Icons.home,
                //             size: 26,
                //             color: Colors.white,
                //           ),
                //           title: Text(
                //             "Default tab",
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontFamily: 'Metropolis',
                //               fontWeight: FontWeight.normal,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.left,
                //           ),
                //           subtitle: Text(
                //             "placeholder <value>",
                //             style: TextStyle(
                //               fontSize: 14,
                //               fontFamily: 'Metropolis',
                //               fontWeight: FontWeight.w200,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.left,
                //           ),
                //           onTap: () {},
                //         ),
                //         ListTile(
                //           contentPadding: EdgeInsets.only(left: 20),
                //           leading: Icon(
                //             Icons.campaign,
                //             size: 26,
                //             color: Colors.white,
                //           ),
                //           title: Text(
                //             "Feedback and corrections",
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontFamily: 'Metropolis',
                //               fontWeight: FontWeight.normal,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.left,
                //           ),
                //           subtitle: Text(
                //             "dialog menu <value>",
                //             style: TextStyle(
                //               fontSize: 14,
                //               fontFamily: 'Metropolis',
                //               fontWeight: FontWeight.w200,
                //               color: Colors.white,
                //             ),
                //             textAlign: TextAlign.left,
                //           ),
                //           onTap: () {},
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                )));
  }
}

// class _DividerShape extends SfDividerShape {
//   @override
//   void paint(PaintingContext context, Offset center, Offset? thumbCenter,
//       Offset? startThumbCenter, Offset? endThumbCenter,
//       {required RenderBox parentBox,
//       required SfSliderThemeData themeData,
//       SfRangeValues? currentValues,
//       dynamic currentValue,
//       required Paint? paint,
//       required Animation<double> enableAnimation,
//       required TextDirection textDirection}) {
//     bool isActive;

//     switch (textDirection) {
//       case TextDirection.ltr:
//         isActive = center.dx <= thumbCenter!.dx;
//         break;
//       case TextDirection.rtl:
//         isActive = center.dx >= thumbCenter!.dx;
//         break;
//     }

//     context.canvas.drawRect(
//         Rect.fromCenter(center: center, width: 5.0, height: 10.0),
//         Paint()
//           ..isAntiAlias = true
//           ..style = PaintingStyle.fill
//           ..color = isActive ? themeData.activeTrackColor! : strikeinactiveClr);
//   }
// }
