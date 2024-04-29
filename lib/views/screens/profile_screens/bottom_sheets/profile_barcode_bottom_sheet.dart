import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:unidbox_app/controllers/profile_controllers/profile_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/bottom_sheets/global_bottom_sheet.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../widgets/button/button_widget.dart';

profileBarCodeBottomSheet(ProfileController controller) {
  return globalBottomSheet(
    barcodeBottomSheetWidget(),
  );
}

Widget barcodeBottomSheetWidget() {
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
        textWidget(
          "Show staff to verify identity",
          fontWeight: FontWeight.w900,
          size: 15,
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 80.w,
          height: 13.h,
          child: SfBarcodeGenerator(
            value: '123456789012',
            showValue: true,
            symbology: EAN13(),
            barColor: AppColor.primary,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
}
