import 'package:flutter/material.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget buttonWidget(String text, VoidCallback onPressed) {
  return ElevatedButton(onPressed: onPressed, child: textWidget(text));
}
