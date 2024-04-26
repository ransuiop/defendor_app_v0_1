// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:defendor_app_v0_1/utils/widgets/omni/omni_app_bar.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  static List settIcons = [
    Icons.tune,
    Icons.notifications_outlined,
    Icons.bookmarks_outlined,
    Icons.info_outline_rounded
  ];
  static List titlesText = ["General", "Notifications", "Bookmarks", "About"];
  static List subtitlesText = [
    "Manage display, accessibility settings, and preferences.",
    "Control how notifications are sent to your device.",
    "Organize your preferred categories and self-defense techniques for your progress.",
    "Learn more about what we're about!"
  ];
  static List settRoutes = [
    '/gen_sett',
    '/notif_sett',
    '/book_sett',
    '/about_sett'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DOmniAppBar(tabName: "Settings"),
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(12),
            physics: AlwaysScrollableScrollPhysics(),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: settRoutes.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Icon(
                      settIcons[index],
                      size: 30,
                    ),
                    title: Text(
                      titlesText[index],
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Text(
                      subtitlesText[index],
                      textAlign: TextAlign.left,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, settRoutes[index]);
                    },
                  );
                }))),
      ),
    );
  }
}
