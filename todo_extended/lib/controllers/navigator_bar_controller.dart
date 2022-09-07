import 'package:get/get.dart';

class NavigatorBarController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedDate = DateTime.now().obs;

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  changeDate(DateTime dateTime) {
    selectedDate.value = dateTime;
  }
}
