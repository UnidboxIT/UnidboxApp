import 'package:flutter/material.dart';

Widget circleIconWidget(IconData iconData, Color bgColor, Color iconColor) {
  return Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Icon(
      iconData,
      color: iconColor,
      size: 20,
    ),
  );
}
