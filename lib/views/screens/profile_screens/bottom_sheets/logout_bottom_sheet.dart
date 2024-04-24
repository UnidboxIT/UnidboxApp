import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import 'package:unidbox_app/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/app_color.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/text_widget.dart';

logoutBottomSheet() {
  return showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: const Color(0xffD8EDE5),
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 30.h,
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: math.pi,
                child: Icon(
                  Icons.logout,
                  color: AppColor.pinkColor,
                  size: 35,
                ),
              ),
              const SizedBox(height: 10),
              textWidget(
                "Logout",
                fontWeight: FontWeight.w900,
                size: 18,
              ),
              const SizedBox(height: 10),
              textWidget(
                "Are you sure you want to logout?",
                size: 13,
                color: AppColor.fontColor,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 30.w,
                height: 35,
                child: buttonWidget("Ok", () {
                  Get.find<LoginController>().logout();
                }),
              )
            ],
          ),
        );
      });
}
