import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isSwitched = false;

  void toggleSwitch(value) {
    isSwitched = value;
    update();
  }
}
