import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget statusWidget() {
  return Row(
    children: [
      eachStatusWidget(Colors.red, "Full"),
      const SizedBox(width: 10),
      eachStatusWidget(Colors.amber, "Limited"),
      const SizedBox(width: 10),
      eachStatusWidget(AppColor.primary, "Available")
    ],
  );
}

Widget eachStatusWidget(Color color, String text) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: 8,
      ),
      const SizedBox(width: 3),
      textWidget(text, size: 12, color: AppColor.fontColor),
    ],
  );
}
