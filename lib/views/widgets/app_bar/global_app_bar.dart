import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget globalAppBarWidget(
  String text,
  VoidCallback onPressed, {
  bool isBackIcon = false,
  bool isIcon = false,
}) {
  return Container(
    height: 20.h,
    width: 100.w,
    decoration: BoxDecoration(color: AppColor.primary),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            height: 60,
            width: 70.w,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: textWidget(
            text,
            fontWeight: FontWeight.w900,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
