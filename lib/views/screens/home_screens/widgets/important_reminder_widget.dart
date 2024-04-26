import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unidbox_app/controllers/notification_controller.dart';
import 'package:unidbox_app/models/noti.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class ImportantReminderWidget extends StatelessWidget {
  const ImportantReminderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NotificationController>().getAllNotiReminder();
    return Container(
      width: 100.w,
      height: 19.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
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
                  if (controller.notiList.isEmpty) {
                    return shimmerReminderWidget();
                  }
                  return buildReminderTextWidget(controller.notiList[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
                itemCount: 2,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildReminderTextWidget(Noti noti) {
    if (noti.trackingValueList.isNotEmpty) {
      return textWidget(
        "${noti.trackingValueList[0].fieldDesc} :  ${noti.trackingValueList[0].oldValue} -> ${noti.trackingValueList[0].newValue}",
      );
    } else {
      return textWidget(noti.body);
    }
  }

  Widget shimmerReminderWidget() {
    return SizedBox(
      width: 100.w,
      height: 40.0,
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: 20.w,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: 2.w,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: 50.w,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
