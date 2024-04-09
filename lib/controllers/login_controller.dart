import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

class LoginController extends GetxController {
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<void> login() async {
    try {
      Response response =
          await AuthService.login(txtUserID.text, txtPassword.text);
      superPrint(response.body);
      superPrint(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        superPrint(response.body);
      }
    } catch (e) {
      superPrint(e);
    }
  }
}
