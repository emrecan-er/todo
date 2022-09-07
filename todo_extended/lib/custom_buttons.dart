import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/buttoncolor_controller.dart';

class CustomButtonLow extends StatelessWidget {
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  final String text;
  final Color activeColor;
  Color inactiveColor = Colors.grey;
  final Function() onPressed;
  CustomButtonLow(
      {required this.text, required this.activeColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color(_buttonColorController.activeColorLow.value)),
        ),
        onPressed: onPressed,
        child: Container(
          width: 60,
          height: 25,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonMedium extends StatelessWidget {
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  final String text;
  final Color activeColor;
  Color inactiveColor = Colors.grey;
  final Function() onPressed;
  CustomButtonMedium(
      {required this.text, required this.activeColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color(_buttonColorController.activeColorMedium.value)),
        ),
        onPressed: onPressed,
        child: Container(
          width: 60,
          height: 25,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonHigh extends StatelessWidget {
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  final String text;
  final Color activeColor;
  Color inactiveColor = Colors.grey;
  final Function() onPressed;
  CustomButtonHigh(
      {required this.text, required this.activeColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color(_buttonColorController.activeColorHigh.value)),
        ),
        onPressed: onPressed,
        child: Container(
          width: 60,
          height: 25,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonDone extends StatelessWidget {
  ButtonColorController _buttonColorController =
      Get.put(ButtonColorController());
  final String text;
  final Color activeColor;
  Color inactiveColor = Colors.grey;
  final Function() onPressed;
  CustomButtonDone(
      {required this.text, required this.activeColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
      ),
      onPressed: onPressed,
      child: Container(
        width: 60,
        height: 25,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
