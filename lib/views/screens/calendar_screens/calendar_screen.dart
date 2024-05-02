import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'calendar_view_screen.dart';
import 'widgets/calendar_app_bar_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());

    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Stack(
              children: [
                const CalendarAppBarWidget(),
                Transform.translate(
                  offset: Offset(0, 9.h),
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const CalendarViewScreen(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
