import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:unidbox_app/controllers/nav_bar_controller.dart';
import 'package:unidbox_app/models/login/admin.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/screens/auth_screens/login_screeen.dart';
import '../../main_screen.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Admin adminData = Admin();
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
      http.Response response = await AuthService.login(
        txtUserID.text.trim(),
        txtPassword.text,
      );
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        adminData = Admin.fromJson(result['result']);
        box.write(AppKeys.apiToken, adminData.sessionId);
        box.write(AppKeys.userInfo, jsonEncode(result['result']));
        var userJson = jsonDecode(box.read(AppKeys.userInfo));
        admin = Admin.fromJson(userJson);
        Get.find<NavBarController>().currentIndex = 0;
        Get.to(() => const MainScreen());
        update();
      } else {
        CommonMethods.customizedAlertDialog(result['result']['error']);
      }
    } catch (e) {
      superPrint(e);
    }
    isLoginLoading = false;
    update();
  }

  Future<void> logout() async {
    box.erase();
    Get.offAll(() => const LoginScreen());
    update();
  }
}
