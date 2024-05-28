import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/back_up/job_order/job_order_update_screens/widgets/job_order_detail/job_detail_widget.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
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
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          partnerWidget(),
          const JobOrderInfoWidget(),
          const JobOrderDetailWidget(),
          SizedBox(
              width: 10, height: 40, child: buttonWidget("Confirm Job", () {}))
        ],
      ),
    );
  }
}
