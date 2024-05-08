import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../../widgets/icon_widget/circle_icon_widget.dart';

Widget partnerWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget("Alice", fontWeight: FontWeight.bold, size: 18),
            textWidget("Customer ID : 123", size: 13)
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: circleIconWidget(
            Icons.phone,
            AppColor.pinkColor,
            Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {},
          child: circleIconWidget(
            CupertinoIcons.chat_bubble_text,
            AppColor.pinkColor,
            Colors.white,
          ),
        ),
      ],
    ),
  );
}
