import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_extended/screens/calendar_screen.dart';
import 'package:todo_extended/screens/pomodoro_screen.dart';
import 'package:todo_extended/screens/settings_screen.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      routes: {
        '/mainlayout': (context) => HomeScreen(),
        '/page1': (context) => CalendarScreen(),
        '/page2': (context) => PomodoroScreen(),
        '/page3': (context) => SettingsScreen(),
      },
      initialRoute: '/mainlayout',
      debugShowCheckedModeBanner: false,
    );
  }
}
