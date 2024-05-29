import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'create_product_widget/camera_widget.dart';
import 'create_product_widget/each_text_field_widget.dart';
import 'widgets/product_variety_widget.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller = Get.find<ProductController>();
      controller.clearProductVariety();
      controller.pageNumber = 1;
      controller.xDataExit = true;
      controller.xLoading = false;
      controller.uomList.clear();
      controller.getUom();
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
          () {
            Get.back();
          },
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
          cameraWidget(controller),
          eachTextFieldWidget("Name", controller.txtName, "Name"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Model", controller.txtModel, "Model"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Vendor", controller.txtVendor, "Vendor"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Brand", controller.txtBrand, "Brand"),
          const SizedBox(height: 10),
          eachTextFieldWidget("Barcode", controller.txtBarcode, "Barcode"),
          const SizedBox(height: 10),
          eachTextFieldWidget(
              "Sale Price (GTS 9% Inc.)", controller.txtSalePrice, "Created by",
              isNumber: true),
          const SizedBox(height: 10),
          eachTextFieldWidget("Cost (GST Excluded)", controller.txtCost, "Cost",
              isNumber: true),
          const SizedBox(height: 10),
          productVarietyWidget(),
          const SizedBox(height: 20),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
          //   child: buttonWidget(
          //     "Submit",
          //     () {
          //       controller.addProductVariety();
          //       controller.txtName.text.isEmpty
          //           ? CommonMethods.customizedAlertDialog(
          //               "Please enter name",
          //               isPop: false,
          //             )
          //           : controller.txtModel.text.isEmpty
          //               ? CommonMethods.customizedAlertDialog(
          //                   "Please enter model",
          //                   isPop: false,
          //                 )
          //               : controller.txtVendor.text.isEmpty
          //                   ? CommonMethods.customizedAlertDialog(
          //                       "Please enter vendor",
          //                       isPop: false,
          //                     )
          //                   : controller.txtBrand.text.isEmpty
          //                       ? CommonMethods.customizedAlertDialog(
          //                           "Please enter brand",
          //                           isPop: false,
          //                         )
          //                       : controller.txtBarcode.text.isEmpty
          //                           ? CommonMethods.customizedAlertDialog(
          //                               "Please enter barcode",
          //                               isPop: false,
          //                             )
          //                           : controller.txtSalePrice.text.isEmpty
          //                               ? CommonMethods.customizedAlertDialog(
          //                                   "Please enter sale price",
          //                                   isPop: false,
          //                                 )
          //                               : controller.txtCost.text.isEmpty
          //                                   ? CommonMethods
          //                                       .customizedAlertDialog(
          //                                       "Please enter cost",
          //                                       isPop: false,
          //                                     )
          //                                   : controller.txtFactor.text.isEmpty
          //                                       ? CommonMethods
          //                                           .customizedAlertDialog(
          //                                           "Please enter factor",
          //                                           isPop: false,
          //                                         )
          //                                       : controller
          //                                               .txtFactor.text.isEmpty
          //                                           ? CommonMethods
          //                                               .customizedAlertDialog(
          //                                               "Please enter price",
          //                                               isPop: false,
          //                                             )
          //                                           : controller
          //                                                   .txtVarietyBarCode
          //                                                   .text
          //                                                   .isEmpty
          //                                               ? CommonMethods
          //                                                   .customizedAlertDialog(
          //                                                   "Please enter product variety barcode",
          //                                                   isPop: false,
          //                                                 )
          //                                               : controller
          //                                                   .createEachProduct();
          //     },
          //     isBool: controller.isCreateProductLoading,
          //   ),
          // ),
          SizedBox(height: 20.h)
        ],
      );
    });
  }
}
