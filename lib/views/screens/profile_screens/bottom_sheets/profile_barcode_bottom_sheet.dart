import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../widgets/button/button_widget.dart';

profileBarCodeBottomSheet() {
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
              textWidget(
                "Show staff to verify identity",
                fontWeight: FontWeight.w900,
                size: 15,
              ),
              SizedBox(height: 5.h),
              BarcodeWidget(
                barcode: Barcode.codabar(printStartStop: true),
                data: '123456',
                color: AppColor.primary,
                width: 50.w,
                height: 13.h,
                textPadding: 10,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 30.w,
                height: 35,
                child: buttonWidget("Ok", () {
                  Get.back();
                }),
              )
            ],
          ),
        );
      });
}
