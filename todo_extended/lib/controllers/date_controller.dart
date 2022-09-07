import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_extended/controllers/task_controller.dart';

TaskController taskController = Get.put(TaskController());

class DateController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2028));
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      taskController.selectedDate.value = selectedDate.value;
      print(selectedDate.value);
    }
  }

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!, initialTime: selectedTime.value);
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
      taskController.selectedTime.value = selectedTime.value;
      print(taskController.selectedTime.value);
    }
  }
}
