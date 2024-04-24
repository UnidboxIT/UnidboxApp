import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget globalAppBarWidget(String text, VoidCallback onPressed,
    {bool isBackIcon = false, bool isIcon = false}) {
  return Container(
    height: 20.h,
    width: 100.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(color: AppColor.primary),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 35,
            width: 200,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        textWidget(text,
            fontWeight: FontWeight.w900, size: 25, color: Colors.white),
      ],
    ),
  );
}
