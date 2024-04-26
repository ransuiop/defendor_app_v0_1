// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/theme/typography.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  static List categories = ['/punch', '/kick', '/block'];
  static List categoriesImgLight = [
    'assets/images/Punch/LPunch.png',
    'assets/images/Kick/LKick.png',
    'assets/images/Block/LBlock.png'
  ];
  static List categoriesImgDark = [
    'assets/images/Punch/DPunch.png',
    'assets/images/Kick/DKick.png',
    'assets/images/Block/DBlock.png'
  ];
  static List categoriesName = ['PUNCHING', 'KICKING', 'BLOCKING'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(appThemeStateNotifier);

    return Scaffold(
      appBar: DOmniAppBar(tabName: "Home"),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          height: 0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, categories[index]),
            child: Container(
              height: 200,
              width: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(themeState.isDarkModeEnabled
                      ? categoriesImgDark[index]
                      : categoriesImgLight[index]),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categoriesName[index],
                  textAlign: TextAlign.center,
                  style: themeState.isDarkModeEnabled
                      ? DTypography.defStydarkCategoriesName
                      : DTypography.defStylightCategoriesName,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
