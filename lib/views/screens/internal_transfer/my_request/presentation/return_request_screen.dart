import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/return_request_reason_state.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../domain/return_request_reason.dart';

class ReturnRequestScreen extends ConsumerStatefulWidget {
  final String productCode;
  final String currentDate;
  final String requestWarehouse;
  final ProductLineId productLine;
  final String currentWarehouse;
  const ReturnRequestScreen(
      {super.key,
      required this.productCode,
      required this.currentDate,
      required this.requestWarehouse,
      required this.productLine,
      required this.currentWarehouse});

  @override
  ConsumerState<ReturnRequestScreen> createState() =>
      _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends ConsumerState<ReturnRequestScreen> {
  List<ReturnRequestReason> returnRequestReasonList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(returnRequestReasonStateNotifierProvider.notifier)
          .getOutletRejectReason();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(returnRequestReasonStateNotifierProvider, (pre, next) {
      if (next is ReturnReceiveLoading) {
        setState(() {
          returnRequestReasonList = [];
        });
      }
      if (next is ReturnRequestReasonList) {
        setState(() {
          returnRequestReasonList = next.returnRequestReasonList;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Return Request",
                  () {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                  },
                ),
                Transform.translate(
                    offset: Offset(0, 15.h), child: returnRequestWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget returnRequestWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: 100.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              )
            ]),
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    widget.productCode,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    size: 20,
                  ),
                  textWidget(
                      DateFormat('dd MMM yyyy').format(
                        DateTime.parse(widget.currentDate),
                      ),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      size: 17)
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: widget.productLine.imageUrl != "false"
                            ? NetworkImage(widget.productLine.imageUrl)
                            : const AssetImage('assets/images/app_icon.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  height: 14.5.h,
                  width: 25.w,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(widget.productLine.productIdList[1],
                            fontWeight: FontWeight.w700,
                            size: 14,
                            color: Colors.black,
                            textOverflow: TextOverflow.fade,
                            textAlign: TextAlign.left),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(widget.productLine.code, size: 13),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: textWidget(
                          "Return To",
                          color: AppColor.orangeColor,
                          size: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 57.w,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.orangeColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: textWidget(widget.requestWarehouse,
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            textWidget(
              "Returned Request By",
              size: 13,
              color: AppColor.orangeColor,
              fontWeight: FontWeight.w500,
            ),
            textWidget(
              widget.currentWarehouse,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            textWidget(
              "Reason",
              size: 13,
              color: AppColor.orangeColor,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 10),
            returnReasonWidget(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 80.w,
                height: 43,
                child: buttonWidget(
                  "Submit Return",
                  () {},
                  bgColor: AppColor.primary,
                  fontColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget returnReasonWidget() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                const Icon(
                  Icons.check_box_outline_blank,
                  size: 18,
                ),
                const SizedBox(width: 8),
                textWidget(
                  returnRequestReasonList[index].reason,
                  fontWeight: FontWeight.w700,
                  size: 14,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: returnRequestReasonList.length);
  }
}