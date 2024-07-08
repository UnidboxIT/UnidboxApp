import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/inventory_tracker_screen.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget makeNewWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      Navigator.of(context)
        ..pop()
        ..pop()
        ..push(MaterialPageRoute(
          builder: (context) => const InventoryTrackerScreen(),
        ));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: 100.w,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.pinkColor.withOpacity(0.2)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              "Make New Request".toUpperCase(),
              fontWeight: FontWeight.w700,
              size: 18,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            )
          ],
        ),
      ),
    ),
  );
}
