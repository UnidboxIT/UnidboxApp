import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import '../../../utils/constant/app_color.dart';
import 'widgets/joborder_app_bar_widget.dart';

class JobOrderDetailScreen extends StatelessWidget {
  const JobOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: const Column(
            children: [
              JobOrderAppBArWidget(
                handymanID: "123455",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
