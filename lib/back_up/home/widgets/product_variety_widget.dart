import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../create_product_widget/each_text_field_widget.dart';
import 'show_uom_dialog.dart';

Widget productVarietyWidget() {
  return GetBuilder<ProductController>(builder: (controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textWidget("Product Variety",
                  color: AppColor.primary, size: 15),
            ),
            GestureDetector(
              onTap: () {
                if (controller.txtVarietyBarCode.text.isNotEmpty &&
                    controller.txtFactor.text.isNotEmpty &&
                    controller.txtPrice.text.isNotEmpty) {
                  controller.incrementProductVariety();
                } else {
                  // CommonMethods.customizedAlertDialog("Please fill all",
                  //     isPop: false);
                }
              },
              child: Container(
                width: 150,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.add_circle_rounded,
                  color: AppColor.orangeColor,
                ),
              ),
            )
          ],
        ),
        eachProductVarietyWidget(controller),
      ],
    );
  });
}

Widget eachProductVarietyWidget(ProductController controller) {
  return Column(
      children: controller.varietyIncrementValueList.map((e) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textWidget(
                "Variety  $e:",
                color: Colors.black.withOpacity(0.6),
                size: 14,
              ),
            ),
            controller.varietyIncrementValueList.length == 1
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      controller.decrementProductVariety(e);
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.transparent,
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.remove_circle_outline_sharp,
                        color: AppColor.pinkColor,
                      ),
                    ),
                  )
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showUomDialog();
                },
                child: SizedBox(
                  width: 42.w,
                  child: eachUomTextWidget(
                    "Uom",
                    controller.uomName,
                  ),
                ),
              ),
              SizedBox(
                width: 42.w,
                child: controller.varietyValueMap[e] != null
                    ? eachProductVarietyTextFieldWidget("Factor",
                        controller.varietyValueMap[e]['factor'].toString())
                    : eachTextFieldWidget(
                        "Factor", controller.txtFactor, "Factor",
                        horizontal: 0, isNumber: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 42.w,
                child: controller.varietyValueMap[e] != null
                    ? eachProductVarietyTextFieldWidget("Price",
                        controller.varietyValueMap[e]['price'].toString())
                    : eachTextFieldWidget("Price", controller.txtPrice, "Price",
                        horizontal: 0, isNumber: true),
              ),
              SizedBox(
                width: 42.w,
                child: controller.varietyValueMap[e] != null
                    ? eachProductVarietyTextFieldWidget(
                        "Barcode", controller.varietyValueMap[e]['barcode'])
                    : eachTextFieldWidget(
                        "Barcode",
                        controller.txtVarietyBarCode,
                        "Barcode",
                        horizontal: 0,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }).toList());
}
