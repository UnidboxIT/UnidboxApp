import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../views/widgets/button_widget.dart';
import '../constant/app_constant.dart';

xUserAuthorized() {
  return apiToken.isNotEmpty;
}

class CommonMethods {
  static Map<String, String> setHeaders() {
    var box = GetStorage();

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read(AppKeys.apiToken)}'
    };
  }

  static void customizedAlertDialog(String message, {bool isPop = true}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 35.w,
              child: buttonWidget("Ok".tr, () {
                Get.back();
              }),
            )
          ],
        ),
      ),
    )).then(
      (value) => isPop ? Get.back(closeOverlays: true) : "",
    );
  }
}
