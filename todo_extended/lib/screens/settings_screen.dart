import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_extended/controllers/navigator_bar_controller.dart';
import 'package:todo_extended/screens/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  NavigatorBarController _navigatorBarController =
      Get.put(NavigatorBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'this is settings screen',
        style: TextStyle(fontSize: 80, color: Colors.black),
      )),
    );
  }
}
