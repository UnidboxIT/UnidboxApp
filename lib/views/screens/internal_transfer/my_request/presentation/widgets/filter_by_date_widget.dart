import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget filterByDateWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Container(
      height: 45,
      width: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              blurRadius: 5,
              spreadRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget("Filter date", color: Colors.grey.shade400, size: 13),
          const Icon(Icons.calendar_month_outlined)
        ],
      ),
    ),
  );
}
