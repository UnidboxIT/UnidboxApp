import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../button/button_widget.dart';
import 'global_bottom_sheet.dart';

successfullyBottomSheet(String title, String bodyText) {
  return globalBottomSheet(
    successfulWidget(title, bodyText),
  );
}

Widget successfulWidget(String title, String bodyText) {
  return Container(
    height: 50.h,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: const Color(0xffD8EDE5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
            width: 60.w, child: Lottie.asset("assets/lottie/success.json")),
        const Spacer(),
        textWidget(
          title,
          fontWeight: FontWeight.w900,
          color: AppColor.pinkColor,
          size: 16,
        ),
        const SizedBox(height: 10),
        textWidget(
          bodyText,
          fontWeight: FontWeight.w500,
          size: 14,
        ),
        const Spacer(),
        SizedBox(
          width: 30.w,
          height: 35,
          child: buttonWidget("Ok", () {
            Get.back();
          }),
        ),
        const Spacer(),
      ],
    ),
  );
}
