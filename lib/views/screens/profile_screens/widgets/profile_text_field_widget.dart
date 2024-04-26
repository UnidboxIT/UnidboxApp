import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

Widget profileTextFieldWidget(TextEditingController controller, String hintText,
    {bool isNumber = false}) {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: TextField(
      textAlign: TextAlign.left,
      controller: controller,
      cursorColor: Colors.grey,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 13,
            color: AppColor.fontColor.withOpacity(0.6),
            fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        suffix: const SizedBox(width: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
