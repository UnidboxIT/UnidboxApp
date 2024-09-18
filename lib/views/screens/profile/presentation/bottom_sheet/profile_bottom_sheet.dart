import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/details/show_barcode_generate_popup.dart';
import '../../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';

profileBarCodeBottomSheet(BuildContext context) {
  return globalBottomSheet(barcodeBottomSheetWidget(context), context);
}

Widget barcodeBottomSheetWidget(BuildContext context) {
  return Container(
    height: 50.h,
    width: 100.w,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: const Color(0xffD8EDE5),
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
        textWidget(
          "Show staff to verify identity",
          fontWeight: FontWeight.w900,
          size: 15,
        ),
        SizedBox(height: 5.h),
        BarcodeWidget(
          data: "UN001",
          code: Barcode.code128(),
        ),
        // SizedBox(
        //   width: 80.w,
        //   height: 13.h,
        //   child: SfBarcodeGenerator(
        //     value: "UN001",
        //     showValue: true,
        //     symbology: Code128(),
        //     // symbology: EAN13(),
        //     barColor: AppColor.primary,
        //     textStyle: const TextStyle(
        //       color: Colors.black,
        //       fontSize: 16,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 30.w,
          height: 35,
          child: buttonWidget("Ok", () {
            Navigator.of(context).pop();
          }),
        )
      ],
    ),
  );
}
