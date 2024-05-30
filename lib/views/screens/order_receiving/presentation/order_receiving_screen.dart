import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/message_screens/widgets/search_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

import 'widgets/search_order_receiving.dart';

class OrderReceivingScreen extends ConsumerStatefulWidget {
  const OrderReceivingScreen({super.key});

  @override
  ConsumerState<OrderReceivingScreen> createState() =>
      _OrderReceivingScreenState();
}

class _OrderReceivingScreenState extends ConsumerState<OrderReceivingScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Orders Receiving",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: orderReceivingBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderReceivingBodyWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Column(
        children: [
          SearchOrderReceiving(),
        ],
      ),
    );
  }
}
