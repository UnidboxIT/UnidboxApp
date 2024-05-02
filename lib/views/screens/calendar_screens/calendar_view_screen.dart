import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/calendar_controllers/calendar_controller.dart';
import 'package:unidbox_app/views/screens/calendar_screens/widgets/status_widget.dart';
import 'widgets/monthly_calendar_view_widget.dart';
import 'widgets/week_calendar_view_widget.dart';

class CalendarViewScreen extends StatelessWidget {
  const CalendarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (controller) {
      return Column(
        children: [
          statusWidget(),
          const SizedBox(height: 10),
          controller.isMonthlyVisible
              ? const MonthlyCalendarViewWidget()
              : const WeekCalendarViewWidget(),
        ],
      );
    });
  }
}
