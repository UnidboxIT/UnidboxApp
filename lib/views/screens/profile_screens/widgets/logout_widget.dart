import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/login_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget logoutWidget() {
  return GestureDetector(
    onTap: () {
      Get.find<LoginController>().logout();
    },
    child: Container(
      width: 30.w,
      height: 50,
      color: Colors.transparent,
      child: Row(
        children: [
          Icon(
            Icons.logout,
            color: AppColor.pinkColor,
          ),
          const SizedBox(width: 10),
          textWidget(
            "Logout",
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            size: 14,
          ),
        ],
      ),
    ),
  );
}
