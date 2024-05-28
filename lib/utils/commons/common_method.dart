import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/auth/presentation/auth_login_screen.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../views/screens/auth/repository/auth_state_notifier.dart';
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

  static String twoDecimalPrice(double number) {
    NumberFormat formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  static threeDecimalPrice(double number) {
    NumberFormat formatter = NumberFormat('#,##0.000');
    return formatter.format(number);
  }

  static void customizedAlertDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 100.w,
          height: 25.h,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.warning,
                color: AppColor.pinkColor,
                size: 30,
              ),
              textWidget(
                message,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                size: 15,
              ),
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
                  Navigator.of(context).pop();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void unAuthorizedLogout() async {
    // Get.find<NavBarController>().currentIndex = 0;
    // Get.find<NavBarController>().update();
    Get.offAll(() => const AuthLoginScreen());
    //customizedAlertDialog("Session Expired".tr);
  }
}
