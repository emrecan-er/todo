import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_extended/controllers/calendar_controller.dart';
import 'package:todo_extended/controllers/task_controller.dart';
import 'package:todo_extended/screens/home_screen.dart';

import '../controllers/navigator_bar_controller.dart';

TaskController taskController = Get.put(TaskController());

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarWidget(
              taskController: taskController,
            ),
            Text(
              'There is ${taskController.taskCounter.value} tasks on this day',
              style: TextStyle(fontSize: 20),
            )
          ]),
    ));
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required TaskController taskController,
  })  : _taskController = taskController,
        super(key: key);

  final TaskController _taskController;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(9)),
        child: SafeArea(
          child: TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDate);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedDate = selectedDay;
              });
            },
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle:
                  TextStyle(color: Colors.black, height: 1, fontSize: 12),
              weekdayStyle:
                  TextStyle(color: Colors.black, height: 1, fontSize: 12),
            ),
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(color: Colors.black),
              selectedDecoration: BoxDecoration(
                color: Colors.black54,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                shape: BoxShape.rectangle,
              ),
              isTodayHighlighted: true,
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            focusedDay: DateTime.now(),
            firstDay: DateTime.now().subtract(
              Duration(days: 1),
            ),
            lastDay: DateTime(2300),
          ),
        ),
      ),
    );
  }
}
