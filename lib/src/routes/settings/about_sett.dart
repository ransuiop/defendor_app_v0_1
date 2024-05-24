// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutSett extends ConsumerWidget {
  const AboutSett({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Scaffold(
      appBar: DOmniAppBar(tabName: ''),
      body: Column(
        children: [
          Row(
            children: [
              themeState.isDarkModeEnabled
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.multiply),
                        child: Image.asset(
                          'assets/images/_Logo/defendorIcon.png',
                          scale: 1.1,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/_Logo/defendorIcon.png',
                        scale: 1.1,
                      ),
                    ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      'DEFENDOR',
                      style: themeState.isDarkModeEnabled
                          ? DTypography.defStydarkAboutHeader
                          : DTypography.defStylightAboutHeader,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      'MediaPipe-based Mobile\nApplication for\nSelf-Defense Instruction',
                      style: themeState.isDarkModeEnabled
                          ? DTypography.defStydarkTrainingDesc
                          : DTypography.defStylightTrainingDesc,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Developed by',
              style: themeState.isDarkModeEnabled
                  ? DTypography.defStydarkSettTilesTitle
                  : DTypography.defStylightSettTilesTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Text(
                  'BALDEROSA, Rixel',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkTrainingName
                      : DTypography.defStylightTrainingName,
                ),
                Text(
                  'Manuscript Writer',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkSettTilesSubtitle
                      : DTypography.defStylightSettTilesSubtitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Text(
                  'DE CHAVEZ, Lance',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkTrainingName
                      : DTypography.defStylightTrainingName,
                ),
                Text(
                  'UI/UX Designer',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkSettTilesSubtitle
                      : DTypography.defStylightSettTilesSubtitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Text(
                  'ILAGAN, Vince',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkTrainingName
                      : DTypography.defStylightTrainingName,
                ),
                Text(
                  'Backend Developer',
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkSettTilesSubtitle
                      : DTypography.defStylightSettTilesSubtitle,
                ),
              ],
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 36.0),
                child: Text(
                  'Since 2023',
                  style: themeState.isDarkModeEnabled
                        ? DTypography.defStydarkSettTilesSubtitle
                        : DTypography.defStylightSettTilesSubtitle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
