import 'package:flutter/material.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget buttonWidget(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: textWidget(
      text,
      fontWeight: FontWeight.w600,
      size: 14,
    ),
  );
}
