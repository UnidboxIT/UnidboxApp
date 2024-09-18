import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../utils/constant/app_color.dart';

showBarcodeGeneratePopUp(BuildContext context, String barcode) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          child: SizedBox(
              width: 100.w,
              height: 25.h,
              child: BarcodeWidget(
                data: barcode,
                code: Barcode.code128(),
              )),
        );
      });
}

class BarcodeWidget extends StatelessWidget {
  final String data;
  final Barcode code;

  const BarcodeWidget({super.key, required this.data, required this.code});

  @override
  Widget build(BuildContext context) {
    final svg = code.toSvg(data, width: 200, height: 100);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SvgPicture.string(
          svg,
          width: 200,
          height: 100,
          fit: BoxFit.contain,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
