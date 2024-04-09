import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/home_screens/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isRememberMe = false;
  bool isLoginLoading = false;

  void clearTextFieldData() {
    txtUserID.clear();
    txtPassword.clear();
  }

  void clickRememberMe() {
    isRememberMe = !isRememberMe;
    update();
  }

  Future<void> login() async {
    isLoginLoading = true;
    update();
    try {
      Response response =
          await AuthService.login(txtUserID.text, txtPassword.text);
      superPrint(response.body);
      superPrint(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.to(() => const HomeScreen());
      } else {
        superPrint(response.body);
      }
    } catch (e) {
      superPrint(e);
    }
    isLoginLoading = false;
    update();
  }
}
