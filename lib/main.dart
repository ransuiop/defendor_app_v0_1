// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:defendor_app_v0_1/config/navigation.dart';
import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'modules/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotifications();
  runApp(ProviderScope(child: Defendor()));
}

// TODO: IFGURE TF OUT THIS FIREBASE STORAGE SHIT (REFERENCES N SHI)
final storage =
    FirebaseStorage.instanceFor(bucket: 'gs://initvideodatabase.appspot.com');

class Defendor extends StatefulWidget {
  const Defendor({super.key, bool? isFirstLaunch});

  @override
  State<Defendor> createState() => _DefendorState();
}

class _DefendorState extends State<Defendor> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeState = ref.watch(appThemeStateNotifier);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: DTheme.lightMode,
          darkTheme: DTheme.darkMode,
          themeMode: themeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
          home: HomeNavView(),
        );
      },
    );
  }
}

initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
