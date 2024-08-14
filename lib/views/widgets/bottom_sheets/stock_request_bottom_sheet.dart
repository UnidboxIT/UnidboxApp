import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import '../text_widget.dart';
import 'global_bottom_sheet.dart';

Future<void> stockRequestSuccessBottomSheet(
    String title,
    String bodyText,
    VoidCallback anotherRequestPressed,
    VoidCallback pendingRequestPressed,
    context,
    {bool isFail = false}) {
  return globalBottomSheet(
      stockRequestBottomSheet(
          title, bodyText, anotherRequestPressed, pendingRequestPressed,
          isFail: isFail),
      context);
}

Widget stockRequestBottomSheet(String title, String bodyText,
    VoidCallback anotherRequestPressed, VoidCallback pendingRequestPressed,
    {bool isFail = false}) {
  return Container(
    height: 50.h,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColor.bottomSheetBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
            width: 60.w,
            child: isFail
                ? Lottie.asset("assets/lottie/fail.json")
                : Lottie.asset("assets/lottie/success.json")),
        const Spacer(),
        textWidget(title,
            fontWeight: FontWeight.w900, color: AppColor.pinkColor, size: 16),
        const SizedBox(height: 10),
        textWidget(
          bodyText,
          fontWeight: FontWeight.w500,
          size: 14,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 5),
            GestureDetector(
              onTap: anotherRequestPressed,
              child: Container(
                  alignment: Alignment.center,
                  width: 46.w,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: textWidget("Make Another\nRequest",
                      textAlign: TextAlign.center,
                      size: 13,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: anotherRequestPressed,
              child: Container(
                  width: 46.w,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: textWidget("Proceed To\nPending Requests",
                      textAlign: TextAlign.center,
                      size: 13,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 5),
          ],
        ),
        const Spacer(),
      ],
    ),
  );
}
