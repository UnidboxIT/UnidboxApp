import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class MyTaskWidget extends StatelessWidget {
  const MyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          textWidget(
            "My Task",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: 25.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              itemBuilder: (context, index) {
                return eachMyTaskWidget();
              },
              itemCount: 4,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 15);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget eachMyTaskWidget() {
    return Container(
      width: 42.w,
      height: 20.h,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.dropshadowColor,
            blurRadius: 4,
            spreadRadius: 4,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(18.w, -3.h),
            child: CircleAvatar(
              backgroundColor: AppColor.pinkColor,
              child: textWidget("18", color: Colors.white, size: 14),
            ),
          ),
          Image.asset(
            "assets/images/car.png",
            width: 50,
            height: 50,
          ),
          const Spacer(),
          textWidget(
            "Inventory",
            color: AppColor.fontColor,
            fontWeight: FontWeight.w800,
            size: 15,
          )
        ],
      ),
    );
  }
}
