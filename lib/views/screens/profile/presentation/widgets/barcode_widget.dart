import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:unidbox_app/views/screens/profile/presentation/bottom_sheet/profile_bottom_sheet.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';

Widget barcodeWidget(BuildContext context) {
  return Container(
    width: 100.w,
    decoration: BoxDecoration(color: AppColor.primary),
    child: Container(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30, right: 10),
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
              profileBarCodeBottomSheet(context);
            },
            child: SizedBox(
              width: 110,
              height: 30,
              child: SfBarcodeGenerator(
                value: 'UN001',
                showValue: false,
                barColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
