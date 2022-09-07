import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_extended/card.dart';
import 'package:todo_extended/controllers/buttoncolor_controller.dart';
import 'package:todo_extended/controllers/date_controller.dart';
import 'package:todo_extended/controllers/dropdown_controller.dart';
import 'package:todo_extended/controllers/navigator_bar_controller.dart';
import 'package:todo_extended/controllers/task_controller.dart';

import 'package:todo_extended/screens/home_screen.dart';

class TasksScreen extends HomeScreen {
  TaskController taskController = Get.put(TaskController());
  NavigatorBarController _navigatorBarController =
      Get.put(NavigatorBarController());
  DropdownController _dropdownController = Get.put(DropdownController());
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  DateController _dateController = Get.put(DateController());
  static String id = 'calendar_screen';
  String whichDay = 'TODAY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
              itemCount: taskController.tumTasklarim.length,
              itemBuilder: (BuildContext context, int index) {
                return taskController.tumTasklarim[index];
              }),
        ),
      ),
    );
  }
}

class TaskCardExtra extends StatelessWidget {
  TaskCardExtra({
    required this.dateText,
    required this.descText,
    required this.dropdownText,
    required this.priority,
    required this.selectedColor,
    required this.titleText,
    required this.taskController,
  });

  final TaskController taskController;
  String dropdownText;
  Color selectedColor;
  String priority;
  String titleText;
  String dateText;
  String descText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 10,
          height: 10,
        ),
        Obx(
          () => Align(
            child: Text(
              taskController.changeDay(),
              style: TextStyle(fontSize: 20, color: Colors.purple),
            ),
            alignment: Alignment.topCenter,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TaskCard(
            dropdownText: dropdownText,
            priority: priority,
            selectedColor: selectedColor,
            titleText: titleText,
            dateText: dateText,
            descText: descText,
          ),
        ),
      ],
    );
  }
}
