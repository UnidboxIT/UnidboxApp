import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../button/button_widget.dart';

successfullyBottomSheet() {
  return showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: const Color(0xffD8EDE5),
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 50.h,
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                  width: 60.w,
                  child: Lottie.asset("assets/lottie/success.json")),
              const Spacer(),
              textWidget(
                "Successfully Updated",
                fontWeight: FontWeight.w900,
                color: AppColor.pinkColor,
                size: 16,
              ),
              const SizedBox(height: 10),
              textWidget(
                "The informations have been updated",
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
      });
}
