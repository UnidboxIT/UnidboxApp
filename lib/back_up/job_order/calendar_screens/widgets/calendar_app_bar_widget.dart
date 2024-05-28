import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class CalendarAppBarWidget extends StatelessWidget {
  const CalendarAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (controller) {
      return Container(
        height: 15.h,
        width: 100.w,
        color: AppColor.primary,
        alignment: Alignment.topCenter,
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
        child: Row(
          children: [
            textWidget(
              "Calendar",
              fontWeight: FontWeight.w900,
              size: 25,
              color: Colors.white,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.toggleMonthlyVisible();
              },
              child: Container(
                width: 45,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Icon(
                  controller.isMonthlyVisible
                      ? CupertinoIcons.calendar
                      : Icons.calendar_month,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
