import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_extended/controllers/date_controller.dart';
import 'package:todo_extended/screens/tasks_screen.dart';

class TaskController extends GetxController {
  var givenTitle = 'Deneme'.obs;
  var givenDesc = 'Deneme'.obs;
  var whichDay = 'Later'.obs;
  var selectedColor = Colors.green.obs;
  var kacgunSonra = ''.obs;
  var selectedDate = DateTime.now().obs;
  var selectedPriority = 'Low'.obs;
  var selectedItem = 'Work'.obs;
  var selectedTime = TimeOfDay.now().obs;
  var taskCounter = 0.obs;
  var calendarSelectedDate = DateTime.now().obs;

  List tumTasklarim = <TaskCardExtra>[].obs;

  DateController _dateController = Get.put(DateController());
  changeTitle(String item) {
    givenTitle.value = item;
    log(givenTitle.value);
  }

  changeCalendarDate(DateTime dateTime) {
    calendarSelectedDate.value = dateTime;
  }

  changeDesc(String item) {
    givenDesc.value = item;
    log(givenDesc.value);
  }

  addItemToList(TaskCardExtra taskCardExtra) {
    tumTasklarim.add(taskCardExtra);
    update();
  }

  changeDay() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final later = DateTime(now.year, now.month, now.day + 2);

    final dateToCheck = _dateController.selectedDate.value;
    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return 'TODAY';
    } else if (aDate == yesterday) {
      return 'YESTERDAY';
    } else if (aDate == tomorrow) {
      return 'TOMORROW';
    } else if (aDate == later) {
      return 'LATER';
    } else {
      return '';
    }
  }
}
