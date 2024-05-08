import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget("Inventory", () {
                Get.back();
              }),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: inventoryBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inventoryBodyWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return eachInventoryWidget(
              "https://img.freepik.com/free-vector/hand-drawn-flat-design-handyman-logo_23-2149250423.jpg",
              "Inventory Tracker",
              "3");
        },
        separatorBuilder: (context, index) {
          return Container(height: 4.h);
        },
        itemCount: 3,
      ),
    );
  }

  Widget eachInventoryWidget(String image, String name, String count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.dropshadowColor,
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ]),
          child: Row(
            children: [
              Image.network(
                image,
                width: 50.w,
                height: 16.h,
              ),
              Expanded(
                child: textWidget(name, size: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: -5,
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            radius: 19,
            child: textWidget(
              count,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 13,
            ),
          ),
        ),
      ],
    );
  }
}
