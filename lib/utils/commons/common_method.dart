import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/nav_bar_controller.dart';
import '../../views/screens/auth_screens/login_screeen.dart';
import '../../views/widgets/button/button_widget.dart';
import '../constant/app_constant.dart';

xUserAuthorized() {
  return apiToken.isNotEmpty;
}

var box = GetStorage();

class CommonMethods {
  static Map<String, String> setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Openerp-Session-Id': '${box.read(AppKeys.apiToken)}'
    };
  }

  static void customizedAlertDialog(String message, {bool isPop = true}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 35.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
              ),
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

  static void unAuthorizedLogout() async {
    Get.find<NavBarController>().currentIndex = 0;
    Get.find<NavBarController>().update();
    box.erase();
    Get.offAll(() => const LoginScreen());
    customizedAlertDialog("Session Expired".tr);
  }
}
