import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:unidbox_app/controllers/profile_controllers/profile_controller.dart';
import '../../../../utils/constant/app_color.dart';
import '../../../widgets/text_widget.dart';
import '../bottom_sheets/profile_barcode_bottom_sheet.dart';

Widget barcodeWidget() {
  return GetBuilder<ProfileController>(builder: (controller) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(color: AppColor.primary),
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 30, right: 10),
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
                // profileBarCodeBottomSheet(controller);
              },
              child: SizedBox(
                width: 110,
                height: 30,
                child: SfBarcodeGenerator(
                  value: '123456789012',
                  showValue: false,
                  barColor: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
              ),
              // child: BarcodeWidget(
              //   barcode: Barcode.code128(),
              //   data: '',
              //   color: Colors.white,
              //   width: 10.w,
              //   height: 5.h,
              // ),
            ),
          ],
        ),
      ),
    );
  });
}
