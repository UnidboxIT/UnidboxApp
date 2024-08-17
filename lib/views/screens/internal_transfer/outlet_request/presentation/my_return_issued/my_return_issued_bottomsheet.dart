import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/constant/app_color.dart';
import 'accepted_my_return_issued_screen.dart';

Future<void> myReturnIsuuedBottomSheet(
    BuildContext context, int warehouseID, String warehouseName) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.black.withOpacity(0.1),
    barrierColor: Colors.black.withOpacity(0.3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    elevation: 0,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // To ensure the sheet is above the keyboard
        ),
        child: Consumer(builder: (context, ref, child) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: productReturnWidget(context, warehouseID, warehouseName),
            ),
          );
        }),
      );
    },
  );
}

Widget productReturnWidget(context, int warehouseID, String warehouseName) {
  return Container(
    width: 100.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColor.bottomSheetBgColor,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        textWidget(
          "You have Pending product\nto be return to $warehouseName",
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          size: 16,
          color: AppColor.pinkColor,
        ),
        const SizedBox(height: 10),
        Lottie.asset(
          'assets/lottie/delivery_man.json',
          width: 100.w,
          height: 20.h,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 30.w,
          height: 35,
          child: buttonWidget(
            "Proceed",
            () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AcceptedMyReturnIssuedScreen(
                        warehouseID: warehouseID,
                        warehouseName: warehouseName,
                      )));
            },
          ),
        ),
        SizedBox(height: 5.h)
      ],
    ),
  );
}
