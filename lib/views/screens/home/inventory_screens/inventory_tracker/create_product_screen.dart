import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';

import 'create_product_widget/camera_widget.dart';
import 'create_product_widget/each_text_field_widget.dart';
import 'widgets/product_variety_widget.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller = Get.find<ProductController>();
      //controller.clearProductVariety();
      superPrint(controller.varietyValueMap);
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: createProductWidget(),
      )),
    );
  }

  Widget createProductWidget() {
    return Stack(
      children: [
        globalAppBarWidget(
          "Create Product",
          () {},
        ),
        Transform.translate(
          offset: Offset(0, 13.h),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: productBodyWidget(),
          ),
        ),
      ],
    );
  }

  Widget productBodyWidget() {
    return GetBuilder<ProductController>(builder: (controller) {
      return ListView(
        children: [
          cameraWidget(),
          eachTextFieldWidget("Name", TextEditingController(), "Name"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Model", TextEditingController(), "Model"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Vendor", TextEditingController(), "Vendor"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Brand", TextEditingController(), "Brand"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Barcode", TextEditingController(), "Barcode"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Sale Price (GTS 9% Inc.)",
              TextEditingController(), "Created by"),
          const SizedBox(height: 10),
          eachTextFieldWidget(
              "Cost (GST Excluded)", TextEditingController(), "Cost"),
          const SizedBox(height: 10),
          productVarietyWidget(),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
            child: buttonWidget("Submit", () {
              controller.addProductVariety();
            }),
          ),
          SizedBox(height: 20.h)
        ],
      );
    });
  }
}
