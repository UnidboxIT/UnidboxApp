import 'package:flutter/material.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachListTileWidget(
  IconData iconData,
  String name,
  Color color,
  VoidCallback onPressed,
) {
  return ListTile(
    onTap: onPressed,
    leading: Icon(iconData, color: color, size: 23),
    contentPadding: EdgeInsets.zero,
    title: textWidget(
      name,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      size: 16,
    ),
    trailing: const SizedBox(
      child: Icon(Icons.arrow_forward_ios_outlined, size: 20),
    ),
  );
}
