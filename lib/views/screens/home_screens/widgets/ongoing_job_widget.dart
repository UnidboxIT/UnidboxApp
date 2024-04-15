import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controller.dart';
import 'package:unidbox_app/models/ongoing_job.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../utils/constant/app_color.dart';

class OngoingJobWidget extends StatelessWidget {
  const OngoingJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getAllOngoingJob();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "Ongoing Job",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(height: 20),
          GetBuilder<HomeController>(builder: (controller) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return eachOngoingJobWidget(controller.ongoingJobList[index]);
              },
              shrinkWrap: true,
              itemCount: controller.ongoingJobList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget eachOngoingJobWidget(OngoingJob ongoingJob) {
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
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32.2.w,
                color: Colors.transparent,
                child: textWidget(
                  ongoingJob.partnerList[1],
                  color: AppColor.pinkColor,
                  size: 14,
                  fontWeight: FontWeight.w900,
                  maxLine: 2,
                  textOverflow: TextOverflow.visible,
                ),
              ),
              const SizedBox(height: 4),
              textWidget(
                ongoingJob.jobType == "job" ? "Servicing" : "Delivery",
                color: AppColor.orangeColor,
                fontWeight: FontWeight.w900,
                size: 14,
              ),
              const Spacer(),
              textWidget(
                "Blk 123A Houngang North #14-532 S(232 123)",
                size: 12,
                color: AppColor.fontColor,
              )
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
}
