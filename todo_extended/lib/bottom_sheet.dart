import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_extended/controllers/buttoncolor_controller.dart';
import 'package:todo_extended/controllers/date_controller.dart';
import 'package:todo_extended/controllers/dropdown_controller.dart';

import 'custom_buttons.dart';

class BottomSheet extends StatelessWidget {
  // List of items in our dropdown menu
  var items = [
    'Default',
    'Personal',
    'Work',
  ];
  DateController _dateController = Get.put(DateController());
  DropdownController _dropdownController = Get.put(DropdownController());
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Align(
              child: Text(
                'Create a New Task',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Task Name',
                ),
                onSaved: (String? value) {
                  //kayıt ediince nolacak halledecez
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your task',
                  labelText: 'Task Note',
                ),
                onSaved: (String? value) {
                  //kayıt ediince nolacak halledecez
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Spacer(),
            Text(
              'Priority',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButtonLow(
                  text: 'Low',
                  activeColor: Colors.green,
                  onPressed: () {
                    _buttonColorController.changeColorLow(0xff006400);
                  },
                ),
                CustomButtonMedium(
                  text: 'Medium',
                  activeColor: Colors.orange,
                  onPressed: () {
                    _buttonColorController.changeColorMedium(0xffFFA500);
                  },
                ),
                CustomButtonHigh(
                  text: 'High',
                  activeColor: Colors.red,
                  onPressed: () {
                    _buttonColorController.changeColorHigh(0xffFF0000);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Spacer(),
            Text(
              'Date & Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () async {
                      _dateController.chooseDate();
                    },
                    child: Text(
                      DateFormat("dd/MM/yyyy")
                          .format(_dateController.selectedDate.value)
                          .toString(),
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 30,
                  ),
                  Icon(
                    Icons.access_time,
                    color: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () async {
                      _dateController.chooseTime();
                    },
                    child: Obx(
                      () => Text(
                        "${_dateController.selectedTime.value.hour}:${_dateController.selectedTime.value.minute}",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              'Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              child: Obx(
                () => DropdownButton(
                  // Initial Value
                  value: _dropdownController.selectedItem.value,
                  itemHeight: 50.0,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (newValue) {
                    _dropdownController.changeItem(newValue);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButtonDone(
                    activeColor: Colors.purple,
                    text: 'Done',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
