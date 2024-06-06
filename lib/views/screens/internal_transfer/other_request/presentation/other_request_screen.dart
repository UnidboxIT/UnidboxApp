import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/presentation/widgets/search_other_request_widget.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/provider/other_request_provider.dart';

import '../../../../../utils/commons/super_print.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import 'other_request_detail_screen.dart';

class OtherRequestScreen extends ConsumerStatefulWidget {
  const OtherRequestScreen({
    super.key,
  });

  @override
  ConsumerState<OtherRequestScreen> createState() => _OtherRequestScreenState();
}

class _OtherRequestScreenState extends ConsumerState<OtherRequestScreen> {
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
                "Requests",
                () {
                  ref
                      .read(otherRequestStateNotifierProvider.notifier)
                      .clearMyRequestValue();
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(65.w, 6.h),
                child: GestureDetector(
                  onTap: () {
                    superPrint("Other request History");
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
                      child: textWidget("Transfered\nHistory",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          size: 17,
                          textAlign: TextAlign.center)),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: otherRequestWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otherRequestWidget() {
    return RefreshIndicator(
      color: AppColor.primary,
      onRefresh: () async {
        ref
            .read(otherRequestStateNotifierProvider.notifier)
            .clearMyRequestValue();
        Future.delayed(const Duration(milliseconds: 10), () {
          ref
              .read(otherRequestStateNotifierProvider.notifier)
              .getAllOtherRequest(0);
        });
      },
      child: Container(
        width: 100.w,
        height: 81.h,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Column(
          children: [
            SearchOtherRequestWidget(),
            Expanded(child: OtherRequestDetailScreen())
          ],
        ),
      ),
    );
  }
}
