import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import '../../../utils/constant/app_color.dart';
import 'widgets/job_order_detail/job_information_widget.dart';
import 'widgets/joborder_app_bar_widget.dart';
import 'widgets/job_order_detail/partner_widget.dart';

class JobOrderDetailScreen extends StatelessWidget {
  const JobOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              const JobOrderAppBArWidget(
                handymanID: "123455",
              ),
              Transform.translate(
                offset: Offset(0, 15.h),
                child: jobOrderDetailBodyWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget jobOrderDetailBodyWidget() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListView(
        children: [
          partnerWidget(),
          const JobOrderInfoWidget(),
        ],
      ),
    );
  }
}
