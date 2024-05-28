import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/back_up/job_order/calendar_screens/widgets/job_order_available_widget.dart';
import 'package:unidbox_app/back_up/job_order/calendar_screens/widgets/job_order_busy_widget.dart';
import 'package:unidbox_app/back_up/job_order/job_order_update_screens/job_order_detail_screen.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../models/job_order/job_order.dart';

class CalendarHandymanAssignWidget extends StatelessWidget {
  const CalendarHandymanAssignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (controller) {
      if (controller.isShowAllFullScreenSize) {
        return calendarHandymanBodyWidget(controller);
      }
      return Expanded(
        child: calendarHandymanBodyWidget(controller),
      );
    });
  }

  Widget calendarHandymanBodyWidget(CalendarController controller) {
    return Container(
      width: 100.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColor.bottomSheetBgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                controller.toggleShowFullScreenSize();
              },
              child: Container(
                width: 100.w,
                padding: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.isShowAllFullScreenSize
                        ? const SizedBox(height: 10)
                        : Center(child: headWidget()),
                    textWidget(
                      DateFormat('dd MMM yyyy').format(controller.selectedDay),
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  handymanAssignWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headWidget() {
    return Container(
      width: 70,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget handymanAssignWidget() {
    return GetBuilder<CalendarController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              controller.handymanTimeFree[0],
              fontWeight: FontWeight.bold,
              size: 13,
              color: Colors.black,
            ),
            Container(
              height: 12.h,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                  const SizedBox(width: 30),
                  eachHandymanWidget(controller,
                      controller.dateRangeMap['9:00 AM : 12:00 PM'] ?? []),
                ],
              ),
            ),
            textWidget(
              controller.handymanTimeFree[1],
              fontWeight: FontWeight.bold,
              size: 13,
              color: Colors.black,
            ),
            Container(
              height: 12.h,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                  const SizedBox(width: 30),
                  eachHandymanWidget(controller,
                      controller.dateRangeMap['12:00 PM : 4:00 PM'] ?? []),
                ],
              ),
            ),
            textWidget(
              controller.handymanTimeFree[2],
              fontWeight: FontWeight.bold,
              size: 13,
              color: Colors.black,
            ),
            Container(
              height: 12.h,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                  const SizedBox(width: 30),
                  eachHandymanWidget(controller,
                      controller.dateRangeMap['4:00 PM : 7:00 PM'] ?? []),
                ],
              ),
            ),
            textWidget(
              controller.handymanTimeFree[3],
              fontWeight: FontWeight.bold,
              size: 13,
              color: Colors.black,
            ),
            Container(
              height: 12.h,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                  const SizedBox(width: 30),
                  eachHandymanWidget(controller,
                      controller.dateRangeMap['7:00 PM : 10:00 PM'] ?? []),
                ],
              ),
            ),
            textWidget(
              controller.handymanTimeFree[4],
              fontWeight: FontWeight.bold,
              size: 13,
              color: Colors.black,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ]);
    });
  }

  Widget eachHandymanWidget(
      CalendarController controller, List<JobOrder> dateRangeMap) {
    return Expanded(
      child: SizedBox(
        width: 100.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (dateRangeMap.isEmpty) {
              return jobOrderAvailableWidget(
                  controller.handymanList[index].name);
            }
            if (dateRangeMap[0]
                .handymanIDs
                .contains(controller.handymanList[index].id)) {
              String jobType = dateRangeMap[0].jobType;
              String address = dateRangeMap[0].deliStreet;
              return GestureDetector(
                onTap: () {
                  Get.to(() => const JobOrderDetailScreen());
                },
                child: jobOrderBusyWidget(
                  controller.handymanList[index].name,
                  jobType,
                  address,
                ),
              );
            }
            return jobOrderAvailableWidget(controller.handymanList[index].name);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
          itemCount: controller.handymanList.length,
        ),
      ),
    );
  }
}
