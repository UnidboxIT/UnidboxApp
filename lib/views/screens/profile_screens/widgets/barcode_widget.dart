import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constant/app_color.dart';
import '../../../widgets/text_widget.dart';
import '../bottom_sheets/profile_barcode_bottom_sheet.dart';

Widget barcodeWidget() {
  return Container(
    width: 100.w,
    decoration: BoxDecoration(color: AppColor.primary),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Profile",
            fontWeight: FontWeight.w600,
            size: 20,
            color: Colors.white,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              profileBarCodeBottomSheet();
            },
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              data: '',
              color: Colors.white,
              width: 10.w,
              height: 5.h,
            ),
          ),
        ],
      ),
    ),
  );
}
