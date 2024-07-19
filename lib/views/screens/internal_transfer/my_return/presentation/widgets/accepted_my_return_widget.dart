import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget acceptedMyReturnWidget(acceptedReturnList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          height: 8.h,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: AppColor.bottomSheetBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                "Accepted Return",
                fontWeight: FontWeight.w800,
                size: 16,
                color: Colors.black,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Visibility(
          //visible: acceptedReturnList.isNotEmpty,
          child: Positioned(
            top: -15,
            right: -10,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.pinkColor,
              child: textWidget(
                "${acceptedReturnList.length}",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
