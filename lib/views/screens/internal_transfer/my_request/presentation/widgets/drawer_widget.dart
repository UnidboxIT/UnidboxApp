import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../inventory_tracker/presentation/inventory_tracker_screen.dart';

Widget draweWidget(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
    {bool isInternalTransfer = false}) {
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Drawer(
        width: 60.w,
        backgroundColor: Colors.white10,
        surfaceTintColor: Colors.white10,
        shadowColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.closeEndDrawer();
              },
              child: Container(
                width: 30.w,
                height: 60,
                alignment: Alignment.bottomRight,
                color: Colors.transparent,
                padding: EdgeInsets.only(right: 5.w),
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            drawerTabWidget("Make New\nRequest", () {
              scaffoldKey.currentState!.closeEndDrawer();
              if (!isInternalTransfer) {
                Navigator.of(context).pop();
              }
              Navigator.of(context)
                ..pop()
                ..push(MaterialPageRoute(
                  builder: (context) => const InventoryTrackerScreen(),
                ));
            }),
            const SizedBox(height: 20),
            drawerTabWidget("Make New\nReturn", () {
              scaffoldKey.currentState!.closeEndDrawer();
            }),
          ],
        ),
      ),
    ),
  );
}

Widget drawerTabWidget(String title, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Container(
        width: 50.w,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.bottomSheetBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textWidget(
              title.toUpperCase(),
              fontWeight: FontWeight.w800,
              size: 18,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
            )
          ],
        ),
      ),
    ),
  );
}
