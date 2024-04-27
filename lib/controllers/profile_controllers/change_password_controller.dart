import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/services/auth_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;

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
      superPrint(result);
      if (result['result']['code'] == 200) {
        successfullyBottomSheet(
          "Successfully Updated",
          "The informations have been updated",
        );
        clearValue();
      } else {
        CommonMethods.customizedAlertDialog(result['result']['error'],
            isPop: false);
      }
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
