import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget insufficientProductWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          height: 8.h,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.pinkColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                "Insufficient Stock Items ",
                size: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
        Positioned(
          top: -15,
          right: -10,
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            child: textWidget(
              "1",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 14,
            ),
          ),
        )
      ],
    ),
  );
}
