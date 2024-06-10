import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../repository/provider/my_request_provider.dart';
import 'my_requests_detail_screen.dart';

class MyRequestScreen extends ConsumerStatefulWidget {
  const MyRequestScreen({super.key});

  @override
  ConsumerState<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends ConsumerState<MyRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "My Requests",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(65.w, 6.h),
                child: GestureDetector(
                  onTap: () {
                    superPrint("My Request History");
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: textWidget("Request\nHistory",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          size: 17)),
                ),
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
    return RefreshIndicator(
      color: AppColor.primary,
      onRefresh: () async {
        Future.delayed(const Duration(milliseconds: 10), () {
          ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest(0);
        });
      },
      child: Container(
        width: 100.w,
        height: 81.h,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const MyRequestsDetailScreen(),
      ),
    );
  }
}
