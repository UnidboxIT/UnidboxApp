import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/create_product/product_variety_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../repository/state/product_variety_state.dart';
import 'camera_widget.dart';
import 'each_create_text_field_widget.dart';

class CreateProductScreen extends ConsumerStatefulWidget {
  const CreateProductScreen({super.key});

  @override
  ConsumerState<CreateProductScreen> createState() =>
      _CreateProductScreenState();
}

class _CreateProductScreenState extends ConsumerState<CreateProductScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtModel = TextEditingController();
  TextEditingController txtVendor = TextEditingController();
  TextEditingController txtBrand = TextEditingController();
  TextEditingController txtBarcode = TextEditingController();
  TextEditingController txtSalePrice = TextEditingController();
  TextEditingController txtCost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(productVariteyStateNotifierProvider, (pre, next) {
      if (next is ProductVarietyValueMap) {
        setState(() {
          varietyValueMap = next.varietyValueMap;
        });
        superPrint(varietyValueMap);
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: createProductWidget(context),
      )),
    );
  }

  Widget createProductWidget(BuildContext context) {
    return Stack(
      children: [
        globalAppBarWidget(
          "Create Product",
          () {
            Navigator.of(context).pop();
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
    return ListView(
      children: [
        const CameraWidget(),
        eachCreateProductTextFieldWidget("Name", txtName, "Name"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Model", txtModel, "Model"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Vendor", txtVendor, "Vendor"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Brand", txtBrand, "Brand"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Barcode", txtBarcode, "Barcode"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget(
            "Sale Price (GTS 9% Inc.)", txtSalePrice, "Created by",
            isNumber: true),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Cost (GST Excluded)", txtCost, "Cost",
            isNumber: true),
        const SizedBox(height: 10),
        const ProductVarietyWidget(),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
          child: buttonWidget(
            "Submit",
            () {
              ref
                  .read(productVariteyStateNotifierProvider.notifier)
                  .addProductVariety(
                    productVarietyIncrement,
                    txtVarietyBarCode.text,
                    selectedUom.name,
                    txtVarietyFactor.text,
                    txtVarietyPrice.text,
                  );
              superPrint(varietyValueMap);
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
            },
            //     isBool: controller.isCreateProductLoading,
          ),
        ),
        SizedBox(height: 20.h)
      ],
    );
  }
}
