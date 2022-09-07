import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_extended/controllers/task_controller.dart';

TaskController taskController = Get.put(TaskController());

class DropdownController extends GetxController {
  var selectedItem = 'Work'.obs;
  var isChecked = false.obs;

  changeItem(item) {
    selectedItem.value = item;
    taskController.selectedItem.value = selectedItem.value;
    log(selectedItem.value.toString());
  }

  checkboxIsChecked(bool? value) {
    isChecked.value = value!;
    log(isChecked.value.toString());
  }
}
