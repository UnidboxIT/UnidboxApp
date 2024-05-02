import 'package:get/get.dart';

class CalendarController extends GetxController {
  bool isMonthlyVisible = true;

  toggleMonthlyVisible() {
    isMonthlyVisible = !isMonthlyVisible;
    update();
  }
}
