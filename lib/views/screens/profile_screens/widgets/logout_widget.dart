import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import 'dart:math' as math;
import '../bottom_sheets/logout_bottom_sheet.dart';

Widget logoutWidget() {
  return GestureDetector(
    onTap: () {
      logoutBottomSheet();
    },
    child: Container(
      width: 30.w,
      height: 50,
      color: Colors.transparent,
      child: Row(
        children: [
          Transform.rotate(
            angle: math.pi,
            child: Icon(
              Icons.logout,
              color: AppColor.pinkColor,
            ),
          ),
          const SizedBox(width: 10),
          textWidget(
            "Logout",
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            size: 14,
          ),
        ],
      ),
    ),
  );
}
