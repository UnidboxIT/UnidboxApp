import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../profile/presentation/change_password/profile_text_field_widget.dart';

Widget eachCreateProductTextFieldWidget(
    String name, TextEditingController controller, String hintText,
    {double horizontal = 20, bool isNumber = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          name,
          fontWeight: FontWeight.bold,
          color: AppColor.pinkColor,
        ),
        const SizedBox(height: 5),
        profileTextFieldWidget(controller, hintText, isNumber: isNumber)
      ],
    ),
  );
}

Widget eachProductVarietyTextFieldWidget(String name, String text,
    {double horizontal = 20}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(
        name,
        fontWeight: FontWeight.bold,
        color: AppColor.pinkColor,
      ),
      const SizedBox(height: 5),
      Container(
        height: 40,
        width: 40.w,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: textWidget(
          text,
          fontWeight: FontWeight.bold,
          size: 14,
        ),
      ),
    ],
  );
}

Widget eachUomTextWidget(String name, String text, {double horizontal = 20}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(
        name,
        fontWeight: FontWeight.bold,
        color: AppColor.pinkColor,
      ),
      const SizedBox(height: 5),
      Container(
        height: 40,
        width: 40.w,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              text,
              fontWeight: FontWeight.bold,
              size: 14,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColor.pinkColor,
            )
          ],
        ),
      ),
    ],
  );
}
