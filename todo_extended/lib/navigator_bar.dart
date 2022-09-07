import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/navigator_bar_controller.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({
    Key? key,
    required NavigatorBarController navigatorBarController,
  })  : _navigatorBarController = navigatorBarController,
        super(key: key);

  final NavigatorBarController _navigatorBarController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedBottomNavigationBar(
        activeIndex: _navigatorBarController.selectedIndex.value,
        backgroundColor: Colors.blueGrey,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          _navigatorBarController.selectedIndex.value = index;
          log(_navigatorBarController.selectedIndex.value.toString());
        },
        icons: [
          Icons.task,
          Icons.calendar_month,
          Icons.access_time_rounded,
          Icons.settings,
        ],
        activeColor: Colors.white,
        inactiveColor: Colors.white54,
      ),
    );
  }
}
