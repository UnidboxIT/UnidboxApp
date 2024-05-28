import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class JobOrderDetailWidget extends StatelessWidget {
  const JobOrderDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            width: 100.w,
            height: 29.h,
            decoration: BoxDecoration(
              color: AppColor.bottomSheetBgColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: const Offset(3, 3),
                )
              ],
            ),
            child: Transform.translate(
              offset: Offset(0, 7.5.h),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    eachTextAndIconWidget(
                      Icons.location_on,
                      "Address",
                      "34355",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        eachTextAndIconWidget(
                          Icons.calendar_month,
                          "Date",
                          DateFormat("dd MMM yyy").format(DateTime.now()),
                        ),
                        const Spacer(),
                        eachTextAndIconWidget(
                          CupertinoIcons.clock,
                          "Time",
                          "34355",
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    eachTextAndIconWidget(
                      CupertinoIcons.person_fill,
                      "Job Assigned By",
                      "AhTan ",
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            decoration: BoxDecoration(
                color: AppColor.pinkColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      spreadRadius: 5)
                ]),
            child: textWidget(
              "Job Information",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget eachTextAndIconWidget(IconData iconData, String title, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 18,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              title.toUpperCase(),
              color: AppColor.orangeColor,
              fontWeight: FontWeight.bold,
              size: 13,
            ),
            textWidget(text, size: 13, fontWeight: FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
