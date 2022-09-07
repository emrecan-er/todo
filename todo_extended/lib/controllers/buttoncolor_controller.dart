import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_extended/controllers/task_controller.dart';

class ButtonColorController extends GetxController {
  TaskController taskController = Get.put(TaskController());
  var inactiveColor = Color(0xffD3D3D3);
  var activeColorLow = 0.obs;
  var activeColorMedium = 0.obs;
  var activeColorHigh = 0.obs;
  var selectedColor = Colors.green.obs;
  var selectedPriority = 'Low'.obs;

  changeColorLow(int hexCode) {
    selectedPriority.value = 'Low';
    taskController.selectedPriority.value = selectedPriority.value;
    selectedColor.value = Colors.green;
    taskController.selectedColor.value = selectedColor.value;
    activeColorLow.value = hexCode;
    activeColorMedium.value = inactiveColor.value;
    activeColorHigh.value = inactiveColor.value;
    log(activeColorLow.value.toString());
  }

  changeColorMedium(int hexCode) {
    selectedPriority.value = 'Medium';
    taskController.selectedPriority.value = selectedPriority.value;
    selectedColor.value = Colors.orange;
    taskController.selectedColor.value = selectedColor.value;
    activeColorMedium.value = hexCode;
    activeColorLow.value = inactiveColor.value;
    activeColorHigh.value = inactiveColor.value;
    log(activeColorLow.value.toString());
  }

  changeColorHigh(int hexCode) {
    selectedPriority.value = 'High';
    taskController.selectedPriority.value = selectedPriority.value;
    selectedColor.value = Colors.red;
    taskController.selectedColor.value = selectedColor.value;
    activeColorHigh.value = hexCode;
    activeColorLow.value = inactiveColor.value;
    activeColorMedium.value = inactiveColor.value;
    log(activeColorLow.value.toString());
  }
}
