import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/home_controllers/home_controller.dart';
import '../../../widgets/text_widget.dart';
import 'widgets/each_ongoing_job_widget.dart';

class OngoingJobScreen extends StatelessWidget {
  const OngoingJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getAllOngoingJob();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
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
            if (controller.ongoingJobList.isEmpty) {
              return const Center(
                child: Text("No Data"),
              );
            }
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (controller.isOngoingJobLoading) {
                  return shimmerOngoingJobWidget();
                }

                String jobType = "";
                for (var data in controller.selectionList) {
                  if (data.value == controller.ongoingJobList[index].jobType) {
                    jobType = data.name;
                  }
                }

                return eachOngoingJobWidget(
                  controller.ongoingJobList[index],
                  jobType,
                );
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
}
