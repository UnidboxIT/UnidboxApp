import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/models/my_task.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachMyTaskWidget(MyTask myTask) {
  return Container(
    width: 42.w,
    padding: const EdgeInsets.symmetric(vertical: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: AppColor.dropshadowColor,
          blurRadius: 4,
          spreadRadius: 4,
          offset: const Offset(3, 4),
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -2.h,
          left: 34.w,
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            child: textWidget("18", color: Colors.white, size: 14),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 3.h),
            CachedNetworkImage(
              imageUrl: myTask.imageUrl,
              width: 150,
              height: 13.h,
              fit: BoxFit.contain,
            ),
            Container(
              height: 6.h,
              width: 100.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
              child: textWidget(
                myTask.name,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w800,
                size: 16,
                maxLine: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ],
    ),
  );
}
