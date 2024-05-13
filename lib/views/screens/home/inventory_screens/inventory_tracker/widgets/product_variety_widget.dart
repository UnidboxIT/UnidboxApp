import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../create_product_widget/each_text_field_widget.dart';

Widget productVarietyWidget() {
  return GetBuilder<ProductController>(builder: (controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget("Product Variety", color: AppColor.primary, size: 15),
              GestureDetector(
                child: Container(
                  width: 30,
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColor.orangeColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          eachProductVarietyWidget(controller),
        ],
      ),
    );
  });
}

Widget eachProductVarietyWidget(ProductController controller) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Variety  ${controller.productVarietyIncrement}:",
            color: Colors.black.withOpacity(0.6),
            size: 14,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 42.w,
                child: eachTextFieldWidget(
                    "Uom", TextEditingController(), "Price",
                    horizontal: 0),
              ),
              SizedBox(
                width: 42.w,
                child: eachTextFieldWidget(
                    "Factor", TextEditingController(), "Barcode",
                    horizontal: 0),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 42.w,
                child: eachTextFieldWidget(
                    "Price", TextEditingController(), "Price",
                    horizontal: 0),
              ),
              SizedBox(
                width: 42.w,
                child: eachTextFieldWidget(
                    "Barcode", TextEditingController(), "Barcode",
                    horizontal: 0),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
