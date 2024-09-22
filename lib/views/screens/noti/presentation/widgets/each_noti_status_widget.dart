import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachNotiStatusWidget(String status, Color bgColor, Color textColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: textWidget(status, color: textColor, size: 10),
  );
}

String dateTimeWidget(DateTime dateTime) {
  final now = DateTime.now();
  // Check if the date is today
  if (now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day) {
    return 'Today, ${DateFormat.jm().format(dateTime)}';
  } else {
    return DateFormat('d MMM yyyy, h:mm a').format(dateTime);
  }
}

Widget eachNotiTextWidget(String title, String body, IconData iconData) {
  return Stack(
    alignment: Alignment.bottomRight,
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 100.w,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            textWidget(
              title,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              size: 17,
            ),
            const SizedBox(height: 2),
            textWidget(
              body,
              color: Colors.black.withOpacity(0.7),
              size: 13,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      Positioned(
        bottom: -0.5.h,
        child: Icon(
          iconData,
          color: AppColor.primary,
        ),
      )
    ],
  );
}
