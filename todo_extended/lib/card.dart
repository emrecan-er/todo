import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_extended/controllers/date_controller.dart';
import 'package:todo_extended/controllers/dropdown_controller.dart';
import 'package:todo_extended/controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  late String titleText;
  late String dropdownText;
  late String descText;
  late String dateText;
  late Color selectedColor;
  late String priority;
  late String selectedTime;
  //late String time;
  TaskCard(
      {required this.dateText,
      // required this.time,
      required this.descText,
      required this.titleText,
      required this.priority,
      required this.selectedColor,
      required this.dropdownText});
  DropdownController _dropdownController = Get.put(DropdownController());
  DateController _dateController = Get.put(DateController());
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            offset: Offset(0, 0),
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        children: [
          Obx(
            () => Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.black,
              focusColor: Colors.red,
              hoverColor: Colors.grey,
              value: _dropdownController.isChecked.value,
              onChanged: (bool? value) {
                _dropdownController.checkboxIsChecked(value);
                log(value.toString());
              },
            ),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                descText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy')
                        .format(_dateController.selectedDate.value)
                        .toString(),
                  ),
                  Obx(
                    () => Text(
                      "  ${_dateController.selectedTime.value.hour}:${_dateController.selectedTime.value.minute}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                dropdownText,
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 30,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: selectedColor,
            ),
            child: Center(
              child: Text(
                priority,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
