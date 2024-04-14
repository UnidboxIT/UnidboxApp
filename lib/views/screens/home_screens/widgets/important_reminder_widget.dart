import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class ImportantReminderWidget extends StatelessWidget {
  const ImportantReminderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: AppColor.primary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Important Reminders :",
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          textWidget(
            "Richard cancelled their appointment for \ninstallation on 24 Oct 2023",
          ),
          const SizedBox(height: 10),
          textWidget(
            "Richard cancelled their appointment for \ninstallation on 24 Oct 2023",
          )
        ],
      ),
    );
  }
}
