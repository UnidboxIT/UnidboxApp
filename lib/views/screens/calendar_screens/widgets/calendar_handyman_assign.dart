import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class CalendarHandymanAssignWidget extends StatelessWidget {
  const CalendarHandymanAssignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: headWidget()),
              textWidget(
                DateFormat('dd MMM yyyy').format(DateTime.now()),
                fontWeight: FontWeight.bold,
                size: 16,
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: controller.handymanTimeFree.map((e) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                e,
                fontWeight: FontWeight.bold,
                size: 13,
                color: Colors.black,
              ),
              e == "05:00 PM"
                  ? SizedBox(height: 10.h)
                  : Container(
                      height: 13.h,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: SizedBox(
                              width: 100.w,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                textWidget("Yan Shan",
                                                    fontWeight: FontWeight.bold,
                                                    size: 16),
                                                textWidget("Servicing",
                                                    size: 13),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    blurRadius: 3,
                                                    spreadRadius: 3,
                                                  )
                                                ],
                                              ),
                                              child: SizedBox(
                                                child: Image.asset(
                                                  'assets/images/service.png',
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        textWidget("Blk 123dkfldf")
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 20);
                                },
                                itemCount: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
            ],
          );
        }).toList(),
      );
    });
  }
}
