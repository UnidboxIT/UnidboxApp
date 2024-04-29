import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/bottom_sheets/global_bottom_sheet.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import 'dart:math' as math;

imageUploadBottomSheet() {
  return globalBottomSheet(
    Container(
      height: 25.h,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imageIconWidget(() {}, "Upload", Icons.logout),
          imageIconWidget(() {}, "Use camera", Icons.camera_enhance),
        ],
      ),
    ),
  );
}

Widget imageIconWidget(VoidCallback onPressed, String text, IconData iconData) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    spreadRadius: 5)
              ]),
          child: text == "Upload"
              ? Transform.rotate(
                  angle: -math.pi / 2,
                  child: Icon(
                    iconData,
                    color: AppColor.orangeColor,
                  ),
                )
              : Icon(
                  iconData,
                  color: AppColor.pinkColor,
                ),
        ),
        const SizedBox(height: 10),
        textWidget(text, fontWeight: FontWeight.bold)
      ],
    ),
  );
}
