// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

// README
// This tab functions as a tool for navigation than it does as a screen for displaying the "home" section.
// The tab that displays the "home" section of the app is HomeTab().
// This is NAMED HomeNavView  because it is the navigation part of the HomeTab

import 'package:defendor_app_v0_1/src/routes/home/1punch/p_training2.dart';
import 'package:defendor_app_v0_1/src/routes/home/1punch/p_training3.dart';
import 'package:defendor_app_v0_1/src/routes/home/2kick/k_training1.dart';
import 'package:defendor_app_v0_1/src/routes/home/2kick/k_training2.dart';
import 'package:defendor_app_v0_1/src/routes/home/2kick/k_training3.dart';
import 'package:defendor_app_v0_1/src/routes/home/3block/b_training1.dart';
import 'package:defendor_app_v0_1/src/routes/home/3block/b_training2.dart';
import 'package:defendor_app_v0_1/src/routes/home/3block/b_training3.dart';
import 'package:defendor_app_v0_1/src/routes/home/_home_tab.dart';
import 'package:defendor_app_v0_1/src/routes/home/_learning_block_tab.dart';
import 'package:defendor_app_v0_1/src/routes/home/_learning_kick_tab.dart';
import 'package:defendor_app_v0_1/src/routes/home/_learning_punch_tab.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

import '../src/routes/onboarding/onboarding1.dart';
import '../src/routes/onboarding/onboarding2.dart';
import '../src/routes/onboarding/onboarding3.dart';
import '../src/routes/settings/_settings_tab.dart';
import '../src/routes/settings/about_sett.dart';
import '../src/routes/settings/book_sett.dart';
import '../src/routes/settings/gen_sett.dart';
import '../src/routes/settings/notif_sett_rem.dart';
import '../src/routes/settings/notif_sett.dart';
import '../src/routes/home/1punch/p_training1.dart';
import '../src/routes/stats/_stats_tab.dart';
import '../src/routes/stats/extended_calendar.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    _homeNavigatorKey,
    _statsNavigatorKey,
    _settNavigatorKey,
  ];

  Future<bool> _systemBackButtonPressed() {
    if (_navigatorKeys[_selectedIndex].currentState?.canPop() == true) {
      _navigatorKeys[_selectedIndex]
          .currentState
          ?.pop(_navigatorKeys[_selectedIndex].currentContext);
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        _systemBackButtonPressed();
      },
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _HomeNavigator(),
              _StatsNavigator(),
              _SettNavigator(),
            ],
          ),
        ),
        bottomNavigationBar:
        // NavigationBarTheme(
        //   data: NavigationBarThemeData(
        //     labelTextStyle: MaterialStateProperty.resolveWith(
        //         (states) => states.contains(MaterialState.selected)
        //             ? TextStyle(
        //                 fontFamily: 'Metropolis',
        //                 fontWeight: FontWeight.w400,
        //                 color: strikeLiteClr,
        //               )
        //             : TextStyle(
        //                 fontFamily: 'Metropolis',
        //                 fontWeight: FontWeight.w400,
        //                 color: Colors.grey,
        //               )),
        //       indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        //   ),
        //   child: NavigationBar(
        //     labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        //     backgroundColor: offbgClr,
        //     indicatorColor: Colors.transparent,
        //     onDestinationSelected: (int index) {
        //       setState(() {
        //         _selectedIndex = index;
        //       });
        //     },
        //     selectedIndex: _selectedIndex,
        //     destinations: [
        //       NavigationDestination(
        //           selectedIcon: Icon(
        //             Icons.home,
        //             color: strikeLiteClr,
        //           ),
        //           icon: Icon(
        //             Icons.home_outlined,
        //             color: Colors.grey,
        //           ),
        //           label: 'Learning'),
        //       NavigationDestination(
        //           selectedIcon: Icon(
        //             Icons.pie_chart,
        //             color: strikeLiteClr,
        //           ),
        //           icon: Icon(
        //             Icons.pie_chart_outline,
        //             color: Colors.grey,
        //           ),
        //           label: 'Stats'),
        //       NavigationDestination(
        //           selectedIcon: Icon(
        //             Icons.settings,
        //             color: strikeLiteClr,
        //           ),
        //           icon: Icon(
        //             Icons.settings_outlined,
        //             color: Colors.grey,
        //           ),
        //           label: 'Settings')
        //     ],
        //   ),
        // ),
        MotionTabBar(
          initialSelectedTab: "Home",
          labels: ["Home", "Statistics", "Settings"],
          icons: [
            Icons.home_outlined,
            Icons.pie_chart_outline,
            Icons.settings_outlined
          ],
          tabSize: 60,
          tabBarHeight: 60,
          textStyle: TextStyle(
            fontSize: 0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: defDBlu,
          tabIconSize: 35,
          tabIconSelectedSize: 35,
          tabSelectedColor: defGry,
          tabIconSelectedColor: defDBlu,
          tabBarColor: defWht,
          onTabItemSelected: (int value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}

class _HomeNavigator extends StatefulWidget {
  const _HomeNavigator();

  @override
  State<_HomeNavigator> createState() => __HomeNavigatorState();
}

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

class __HomeNavigatorState extends State<_HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return HomeTab();
              case '/onb1':
                return Onboarding1();
              case '/onb2':
                return Onboarding2();
              case '/onb3':
                return Onboarding3();
              case '/punch':
                return LearningPunchTab();
              case '/pt1':
                return PTraining1();
              case '/pt2':
                return PTraining2();
              case '/pt3':
                return PTraining3();
              case '/kick':
                return LearningKickTab();
              case '/kt1':
                return KTraining1();
              case '/kt2':
                return KTraining2();
              case '/kt3':
                return KTraining3();
              case '/block':
                return LearningBlockTab();
              case '/bt1':
                return BTraining1();
              case '/bt2':
                return BTraining2();
              case '/bt3':
                return BTraining3();
              default:
                return HomeNavView();
            }
          },
        );
      },
    );
  }
}

class _StatsNavigator extends StatefulWidget {
  const _StatsNavigator();

  @override
  State<_StatsNavigator> createState() => __StatsNavigatorState();
}

GlobalKey<NavigatorState> _statsNavigatorKey = GlobalKey<NavigatorState>();

class __StatsNavigatorState extends State<_StatsNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _statsNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return StatsTab();
              case '/ext_cal':
                return ExtendedCalendar();
              default:
                return StatsTab();
            }
          },
        );
      },
    );
  }
}

class _SettNavigator extends StatefulWidget {
  const _SettNavigator();

  @override
  State<_SettNavigator> createState() => __SettNavigatorState();
}

GlobalKey<NavigatorState> _settNavigatorKey = GlobalKey<NavigatorState>();

class __SettNavigatorState extends State<_SettNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _settNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return SettingsTab();
              case '/gen_sett':
                return GenSett();
              case '/notif_sett':
                return NotifSett();
              case '/notif_rem_sett':
                return NotifRemSett();
              case '/book_sett':
                return BookSett();
              case '/about_sett':
                return AboutSett();
              default:
                return SettingsTab();
            }
          },
        );
      },
    );
  }
}
