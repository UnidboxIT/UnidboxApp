import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachMyTaskWidget() {
  return Container(
    width: 42.w,
    height: 20.h,
    padding: const EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: AppColor.dropshadowColor,
          blurRadius: 4,
          spreadRadius: 4,
          offset: const Offset(3, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Transform.translate(
          offset: Offset(18.w, -3.h),
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            child: textWidget("18", color: Colors.white, size: 14),
          ),
        ),
        Image.asset(
          "assets/images/car.png",
          width: 50,
          height: 50,
        ),
        const Spacer(),
        textWidget(
          "Inventory",
          color: AppColor.fontColor,
          fontWeight: FontWeight.w800,
          size: 15,
        )
      ],
    ),
  );
}
