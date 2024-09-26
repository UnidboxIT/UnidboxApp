import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../../main.dart';
import '../../domain/noti.dart';

class ImportantReminderWidget extends ConsumerWidget {
  final List<Noti> notiList;
  final bool isLoading;
  const ImportantReminderWidget(
      {super.key, required this.notiList, required this.isLoading});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(2.w, 0),
          child: Image.asset(
            "assets/images/reminder_image.png",
          ),
        ),
        Container(
          width: 100.w,
          height: 19.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "Important Reminders :",
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              notiInfo.body.toString().isEmpty
                  ? SizedBox.fromSize()
                  : Expanded(
                      child: textWidget(
                        notiInfo.body.toString(),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ),
                    ),
              isLoading
                  ? Container()
                  : notiList.isEmpty
                      ? Container(
                          child: textWidget(notiInfo.body.toString().isNotEmpty
                              ? ""
                              : "No Important Reminders"),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // if (controller.isReminderLoading) {
                            //   return shimmerReminderWidget();
                            // }
                            return buildReminderTextWidget(notiList[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 5);
                          },
                          itemCount: 2,
                        ),
            ],
          ),
        ),
      ],
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
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade50,
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
            baseColor: Colors.grey.shade100,
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
            baseColor: Colors.grey.shade100,
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
