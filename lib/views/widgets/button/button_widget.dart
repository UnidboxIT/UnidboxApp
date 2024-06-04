import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget buttonWidget(
  String text,
  VoidCallback onPressed, {
  bool isBool = false,
  double elevation = 1,
  Color bgColor = Colors.white,
  Color fontColor = Colors.black,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      surfaceTintColor: bgColor,
      backgroundColor: bgColor,
      foregroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: elevation,
    ),
    child: isBool
        ? Center(
            child: CupertinoActivityIndicator(
              color: AppColor.primary,
            ),
          )
        : textWidget(
            text,
            fontWeight: FontWeight.w600,
            size: 14,
            color: fontColor,
          ),
  );
}
