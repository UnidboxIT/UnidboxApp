import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/auth_controllers/login_controller.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/screens/auth_screens/login_screeen.dart';

import '../../models/login/admin.dart';
import '../../views/widgets/bottom_sheets/successfully_bottom_sheet.dart';

class ChangePasswordController extends GetxController {
  TextEditingController txtOldPwd = TextEditingController();
  TextEditingController txtNewPwd = TextEditingController();
  TextEditingController txtConfirmPwd = TextEditingController();
  bool isUpdateLoading = false;

  Future<void> changePwd() async {
    isUpdateLoading = true;
    update();
    try {
      http.Response response = await AuthService.changePassword(
        txtOldPwd.text,
        txtNewPwd.text,
        txtConfirmPwd.text,
      );
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        successfullyBottomSheet(
            "Successfully Updated", "The informations have been updated", () {
          var userJson = jsonDecode(box.read(AppKeys.userInfo));
          admin = Admin.fromJson(userJson);
          var loginController = Get.find<LoginController>();
          loginController.txtUserID.text = admin.username;
          loginController.txtPassword.clear();
          Get.offAll(() => const LoginScreen());
        });
        clearValue();
      } else {
        CommonMethods.customizedAlertDialog(result['result']['error'],
            isPop: false);
      }
      FocusManager.instance.primaryFocus!.unfocus();
    } catch (e) {
      superPrint(e);
    }
    isUpdateLoading = false;
    update();
  }

  clearValue() {
    txtNewPwd.clear();
    txtConfirmPwd.clear();
    txtOldPwd.clear();
  }
}
