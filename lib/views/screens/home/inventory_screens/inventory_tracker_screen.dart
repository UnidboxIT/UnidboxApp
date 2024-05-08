import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'widgets/inventory_app_bar_widget.dart';

class InventoryTrackerScreen extends StatelessWidget {
  const InventoryTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              inventoryAppBarWidget(
                "Inventory Tracker",
                () {
                  Get.back();
                },
                () {},
                Icons.add,
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: inventoryTrackerBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inventoryTrackerBodyWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
      child: Container(),
    );
  }
}
