import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_detail_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget stockButtonWidget(
    VoidCallback onPressed, String text, ProductDetailController controller) {
  return Container(
    height: 35,
    width: 42.5.w,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3))
        ]),
    child: ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          controller.stockName == text ? AppColor.pinkColor : Colors.white,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: textWidget(
        text,
        fontWeight: FontWeight.bold,
        size: 13,
        color: controller.stockName == text ? Colors.white : Colors.black,
      ),
    ),
  );
}