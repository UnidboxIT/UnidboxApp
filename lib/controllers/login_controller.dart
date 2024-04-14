import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unidbox_app/models/admin.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../main_screen.dart';

class LoginController extends GetxController {
  Admin admin = Admin();
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var box = GetStorage();

  bool isRememberMe = false;
  bool isLoginLoading = false;
  bool isVisiblity = false;

  void clearTextFieldData() {
    txtUserID.clear();
    txtPassword.clear();
  }

  void clickRememberMe() {
    isRememberMe = !isRememberMe;
    update();
  }

  void isToggleVisiblity() {
    isVisiblity = !isVisiblity;
    update();
  }

  Future<void> login() async {
    isLoginLoading = true;
    update();
    try {
      Response response = await AuthService.login(
          // txtUserID.text,
          // txtPassword.text,
          "it@camprojects.com.sg",
          "admin@15.udx");
      if (response.statusCode == 200 || response.statusCode == 201) {
        admin = Admin.fromJson(response.body['result']);
        superPrint(admin);
        Get.to(() => const MainScreen());
      } else {
        CommonMethods.customizedAlertDialog(response.body['result']['error']);
      }
    } catch (e) {
      superPrint(e);
    }
    isLoginLoading = false;
    update();
  }
}
