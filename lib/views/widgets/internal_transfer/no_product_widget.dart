import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../text_widget.dart';

Widget noAcceptPackedProductWidget(String title, String subtitle) {
  return Container(
    alignment: Alignment.center,
    width: 100.w,
    height: 25.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          title,
          size: 30,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        textWidget(
          subtitle,
          size: 26,
          color: Colors.black.withOpacity(0.2),
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
