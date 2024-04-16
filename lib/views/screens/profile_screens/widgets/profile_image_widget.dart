import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget profileImageWidget() {
  return Column(
    children: [
      const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/834872/pexels-photo-834872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        ),
      ),
      const SizedBox(height: 10),
      textWidget(
        "Ah Tan",
        color: AppColor.fontColor,
        fontWeight: FontWeight.w600,
        size: 16,
      )
    ],
  );
}
