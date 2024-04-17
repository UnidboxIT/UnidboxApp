import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/models/ongoing_job.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../utils/constant/app_color.dart';

Widget eachOngoingJobWidget(OngoingJob ongoingJob, String jobType) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.dropshadowColor,
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(3, 4),
          ),
        ]),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 23),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 26.w,
              color: Colors.transparent,
              child: textWidget(
                ongoingJob.partnerList[1],
                color: AppColor.pinkColor,
                size: 14,
                fontWeight: FontWeight.bold,
                maxLine: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            textWidget(
              jobType,
              color: AppColor.orangeColor,
              fontWeight: FontWeight.w900,
              size: 14,
            ),
            const Spacer(),
            textWidget(
              ongoingJob.deliStreet,
              size: 12,
              maxLine: 1,
              color: AppColor.fontColor,
              textOverflow: TextOverflow.ellipsis,
            ),
            ongoingJob.deliPostalCode == "false"
                ? const SizedBox()
                : const SizedBox(height: 5),
            textWidget(
              ongoingJob.deliPostalCode == "false"
                  ? ""
                  : "(${ongoingJob.deliPostalCode})",
              size: 12,
              maxLine: 1,
              color: AppColor.fontColor,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Positioned(
          top: -2.8.h,
          right: -2.8.w,
          child: Container(
            width: 50,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.iconBgColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ]),
          ),
        ),
        Positioned(
          top: -2.h,
          right: -0.5.w,
          child: Image.asset(
            ongoingJob.jobType == "job"
                ? "assets/images/service.png"
                : "assets/images/car.png",
            width: 30,
            height: 30,
          ),
        ),
      ],
    ),
  );
}
