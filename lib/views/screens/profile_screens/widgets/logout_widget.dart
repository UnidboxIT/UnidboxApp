import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget logoutWidget() {
  return Row(
    children: [
      Icon(
        Icons.logout,
        color: AppColor.pinkColor,
      ),
      const SizedBox(width: 10),
      textWidget(
        "Logout",
        color: AppColor.fontColor,
        fontWeight: FontWeight.w600,
        size: 14,
      ),
    ],
  );
}
