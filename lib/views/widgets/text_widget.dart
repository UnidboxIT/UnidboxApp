import 'package:flutter/material.dart';

Widget textWidget(String text,
    {FontWeight fontWeight = FontWeight.w500,
    double size = 14,
    Color color = Colors.black,
    int? maxLine,
    TextOverflow textOverflow = TextOverflow.visible,
    TextAlign textAlign = TextAlign.justify}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: size,
      color: color,
    ),
    overflow: textOverflow,
    maxLines: maxLine,
    textAlign: textAlign,
    softWrap: true,
  );
}
