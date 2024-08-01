import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';

Future<void> returnRequestSuccessBottomSheet(
    VoidCallback confirmButton, context,
    {bool isFail = false}) {
  return globalBottomSheet(
      stockRequestBottomSheet(confirmButton, isFail: isFail), context);
}

Widget stockRequestBottomSheet(VoidCallback confirmButton,
    {bool isFail = false}) {
  return Container(
    height: 50.h,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColor.bottomSheetBgColor,
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
        textWidget("Request Sent!",
            fontWeight: FontWeight.w900, color: AppColor.pinkColor, size: 16),
        const SizedBox(height: 10),
        textWidget(
          "Check status under my return",
          fontWeight: FontWeight.w500,
          size: 14,
        ),
        const Spacer(),
        SizedBox(
          width: 45.w,
          height: 40,
          child: buttonWidget("Confirm", confirmButton,
              textAlign: TextAlign.center),
        ),
        const Spacer(),
      ],
    ),
  );
}
