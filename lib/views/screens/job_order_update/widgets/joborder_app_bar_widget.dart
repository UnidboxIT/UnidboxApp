import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class JobOrderAppBArWidget extends StatelessWidget {
  final String handymanID;
  const JobOrderAppBArWidget({super.key, required this.handymanID});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20.h,
        width: 100.w,
        color: AppColor.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            textWidget("No. #$handymanID",
                color: Colors.white, size: 20, fontWeight: FontWeight.bold),
          ],
        ));
  }
}
