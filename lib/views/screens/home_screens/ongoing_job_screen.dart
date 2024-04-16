import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../widgets/text_widget.dart';
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
}
