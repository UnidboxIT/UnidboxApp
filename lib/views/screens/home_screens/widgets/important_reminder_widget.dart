import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/notification_controller.dart';
import 'package:unidbox_app/models/noti.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class ImportantReminderWidget extends StatelessWidget {
  const ImportantReminderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NotificationController>().getAllNotiReminder();
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
      child: GetBuilder<NotificationController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "Important Reminders :",
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    superPrint(controller.notiList.length);
                    return buildReminderTextWidget(controller.notiList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 5);
                  },
                  itemCount: 2),
            ],
          );
        },
      ),
    );
  }

  Widget buildReminderTextWidget(Noti noti) {
    return textWidget(
      "${noti.trackingValueList[0].fieldDesc} :  ${noti.trackingValueList[0].oldValue} -> ${noti.trackingValueList[0].newValue}",
    );
  }
}
