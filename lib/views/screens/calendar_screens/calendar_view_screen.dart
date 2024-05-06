import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/views/screens/calendar_screens/widgets/status_widget.dart';
import 'widgets/calendar_handyman_assign.dart';
import 'widgets/monthly_calendar_view_widget.dart';
import 'widgets/week_calendar_view_widget.dart';

class CalendarViewScreen extends StatelessWidget {
  const CalendarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (controller) {
      return controller.isShowAllFullScreenSize
          ? const CalendarHandymanAssignWidget()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: statusWidget(),
                ),
                const MonthlyCalendarViewWidget(),
                // controller.isMonthlyVisible
                //     ? const MonthlyCalendarViewWidget()
                //     : const WeekCalendarViewWidget(),
                const SizedBox(height: 15),
                const CalendarHandymanAssignWidget()
              ],
            );
    });
  }
}
