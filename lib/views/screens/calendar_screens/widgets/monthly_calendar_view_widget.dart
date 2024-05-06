import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unidbox_app/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class MonthlyCalendarViewWidget extends StatefulWidget {
  const MonthlyCalendarViewWidget({super.key});

  @override
  State<MonthlyCalendarViewWidget> createState() =>
      _MonthlyCalendarViewWidgetState();
}

class _MonthlyCalendarViewWidgetState extends State<MonthlyCalendarViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ]),
            child: TableCalendar(
              firstDay: DateTime.utc(2023),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: controller.focusedDay,
              calendarFormat: controller.isMonthlyVisible
                  ? CalendarFormat.month
                  : CalendarFormat.week,
              headerVisible: true,
              daysOfWeekHeight: 20,
              headerStyle: const HeaderStyle(
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleCentered: false,
                formatButtonVisible: false,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                if (selectedDay.isAfter(DateTime.now())) {
                  controller.updateSelectedDateTime(selectedDay);
                  Get.find<CalendarController>().jobOrderByDateRate(
                    DateFormat('yyyy-MM-dd').format(selectedDay),
                    DateFormat('yyyy-MM-dd').format(focusedDay),
                  );
                }
              },
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //  _selectDate(context);
                            });
                          },
                          child: textWidget(
                            DateFormat('MMM yyyy').format(day),
                            fontWeight: FontWeight.w600,
                            size: 15,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.focusedDay = DateTime.utc(
                                controller.focusedDay.year,
                                controller.focusedDay.month - 1,
                                controller.focusedDay.day,
                              );
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 35,
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: Icon(
                              CupertinoIcons.chevron_left,
                              color: AppColor.pinkColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.focusedDay = DateTime.utc(
                                controller.focusedDay.year,
                                controller.focusedDay.month + 1,
                                controller.focusedDay.day,
                              );
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 35,
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: Icon(
                              CupertinoIcons.chevron_right,
                              color: AppColor.orangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                outsideBuilder: (context, day, focusedDay) {
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textWidget(day.day.toString(),
                            color: Colors.grey.shade400),
                        const SizedBox(
                          width: 5,
                          height: 5,
                        )
                      ],
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  int differenceInDays = day.difference(focusedDay).inDays;
                  final isBeforeToday = day.isBefore(DateTime.now());
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: day.day == controller.selectedDay.day
                            ? Colors.blue
                            : Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textWidget(day.day.toString(),
                            color: day.day == controller.selectedDay.day
                                ? Colors.white
                                : isBeforeToday
                                    ? Colors.grey
                                    : Colors.black),
                        differenceInDays < 4 &&
                                day.month == DateTime.now().month &&
                                !isBeforeToday
                            ? Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.orangeColor),
                              )
                            : Container()
                      ],
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: day.day == controller.selectedDay.day
                          ? Colors.blue
                          : Colors.lightBlueAccent.withOpacity(0.15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textWidget(day.day.toString(),
                            color: day.day == controller.selectedDay.day
                                ? Colors.white
                                : Colors.black),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: focusedDay,
  //     firstDate: DateTime(2010, 10),
  //     lastDate: DateTime(2030, 3),
  //     initialDatePickerMode: DatePickerMode.year,
  //   );

  //   if (picked != focusedDay) {
  //     setState(() {
  //       focusedDay = picked!;
  //     });
  //   }
  // }
}
