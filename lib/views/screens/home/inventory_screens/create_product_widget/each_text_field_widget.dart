import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../profile_screens/widgets/profile_text_field_widget.dart';

Widget eachTextFieldWidget(
    String name, TextEditingController controller, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          name,
          fontWeight: FontWeight.bold,
          color: AppColor.pinkColor,
        ),
        const SizedBox(height: 5),
        profileTextFieldWidget(controller, hintText)
      ],
    ),
  );
}
