import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/presentation/auth_login_screen.dart';
import '../../auth/repository/auth_state_notifier.dart';
import '../../views/widgets/button/button_widget.dart';
import '../constant/app_constant.dart';

xCheckUserAuthorized(WidgetRef ref) {
  return ref
      .watch(authStateNotifierControllerProvider.notifier)
      .checkUserAuthorization();
}

xUserAuthorized() {
  return apiToken.isNotEmpty;
}

class CommonMethods {
  static Map<String, String> setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Openerp-Session-Id': apiToken
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
    // Get.find<NavBarController>().currentIndex = 0;
    // Get.find<NavBarController>().update();
    Get.offAll(() => const AuthLoginScreen());
    customizedAlertDialog("Session Expired".tr);
  }
}
