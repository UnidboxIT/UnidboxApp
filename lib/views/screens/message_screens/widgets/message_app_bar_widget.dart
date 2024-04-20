import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget messageAppBarWidget(String text) {
  return Container(
    height: 20.h,
    width: 100.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(color: AppColor.primary),
    child: textWidget(
      text,
      fontWeight: FontWeight.w900,
      size: 25,
      color: Colors.white,
    ),
  );
}
