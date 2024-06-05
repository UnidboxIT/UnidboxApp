import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unidbox_app/views/screens/home/domain/my_task.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachMyTaskWidget(MyTask myTask) {
  return Container(
    width: 45.w,
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
          left: 37.w,
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            child: textWidget("18", color: Colors.white, size: 14),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 2.h),
            SizedBox(
              width: 150,
              height: 13.h,
              child: Image.network(
                myTask.imageUrl,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 6.h,
              width: 100.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
              child: textWidget(
                myTask.name,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w800,
                size: 20,
                maxLine: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ],
    ),
  );
}

Widget shimmerMyTaskWidget() {
  return SizedBox(
    width: 40.w,
    height: 40.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: Container(
            width: 40.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          top: 15,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 33.w,
              height: 15.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 33.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
