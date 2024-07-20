import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../my_request/domain/my_request.dart';
import '../../my_request/domain/return_request_reason.dart';
import '../../my_request/presentation/return_request_screen.dart';
import '../repository/provider/my_return_provider.dart';
import '../repository/state/my_return_reason_state.dart';
import '../repository/state/my_return_state.dart';
import 'widgets/each_my_return_reason_widget.dart';
import 'widgets/scan_search_bar_widget.dart';

class UpdateMyReturnScreen extends ConsumerStatefulWidget {
  final String productCode;
  final String currentDate;
  final String requestWarehouse;
  final ProductLineId productLine;
  final String currentWarehouse;
  final double receiveQty;
  const UpdateMyReturnScreen({
    super.key,
    required this.productCode,
    required this.currentDate,
    required this.requestWarehouse,
    required this.productLine,
    required this.currentWarehouse,
    required this.receiveQty,
  });

  @override
  ConsumerState<UpdateMyReturnScreen> createState() =>
      _UpdateMyReturnScreenState();
}

class _UpdateMyReturnScreenState extends ConsumerState<UpdateMyReturnScreen>
    with WidgetsBindingObserver {
  List<ReturnRequestReason> myReturnReason = [];
  List<int> reasonIndex = [];
  bool isMyReturnUpdate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(myReturnReasonStateNotifierProvider.notifier)
          .getAllMyReturnReason();
    });
    reasonQtyMap.clear();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myReturnReasonStateNotifierProvider, (pre, next) {
      if (next is MyReturnReasonLoading) {
        setState(() {
          myReturnReason = [];
        });
      }
      if (next is MyReturnReasonList) {
        setState(() {
          myReturnReason = next.myReturnReasonList;
          isMyReturnUpdate = false;
        });
      }
    });
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnUpdateLoading) {
        setState(() {
          isMyReturnUpdate = true;
        });
      }
      if (next is MyReturnError) {
        setState(() {
          isMyReturnUpdate = false;
        });
      }
      if (next is MyReturnUpdateSuccess) {
        setState(() {
          isMyReturnUpdate = false;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  globalAppBarWidget(
                    "Edit Return Request",
                    () {
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          true;
                      Navigator.of(context).pop();
                    },
                  ),
                  Transform.translate(
                    offset: Offset(0, 14.h),
                    child: editMyReturnWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget editMyReturnWidget() {
    return Container(
      width: 100.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          scanSearchBarWidget(),
          Expanded(child: returnRequestWidget()),
        ],
      ),
    );
  }

  Widget returnRequestWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 66.h,
            decoration: BoxDecoration(
              color: AppColor.bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ],
              ),
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
                                : const AssetImage(
                                    'assets/images/app_icon.jpeg'),
                            fit: BoxFit.cover,
                          ),
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
                              child: textWidget(
                                  widget.productLine.productIdList[1],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: Colors.black,
                                  textOverflow: TextOverflow.fade,
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  textWidget(widget.productLine.code, size: 13),
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
                              child: textWidget(widget.currentWarehouse,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
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
                    widget.requestWarehouse,
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
                  const SizedBox(height: 5),
                  returnReasonWidget(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 35.w,
                          height: 43,
                          child: buttonWidget(
                            "Cancel",
                            () {
                              Navigator.of(context).pop();
                            },
                            fontColor: AppColor.primary,
                          ),
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 43,
                          child: buttonWidget(
                            "Update",
                            () {
                              superPrint(reasonIndex);
                              superPrint(txtOtherComment.text);
                              ref
                                  .read(myReturnStateNotifierProvider.notifier)
                                  .updateMyReturn(
                                      widget.productLine.warehouseList[0],
                                      widget.productLine.requestWarehouse[0],
                                      widget.productLine.productIdList[0],
                                      widget.productLine.productIdList[1],
                                      widget.receiveQty.toInt(),
                                      widget.productLine.price,
                                      widget.productLine.productUomList[0],
                                      reasonIndex,
                                      txtOtherComment.text,
                                      context,
                                      ref);
                            },
                            isBool: isMyReturnUpdate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  Widget returnReasonWidget() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    int sumRecevieQty = reasonQtyMap.values.fold(
                        0, (previousValue, element) => previousValue + element);
                    if (!reasonIndex.contains(myReturnReason[index].id)) {
                      if (widget.receiveQty > sumRecevieQty) {
                        reasonIndex.add(myReturnReason[index].id);
                      }
                    } else {
                      reasonQtyMap.remove(myReturnReason[index].id);
                      reasonIndex.remove(myReturnReason[index].id);
                    }
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        reasonIndex.contains(myReturnReason[index].id)
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      textWidget(
                        myReturnReason[index].reason,
                        fontWeight: FontWeight.w700,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: reasonIndex.contains(myReturnReason[index].id),
                child: EachMyReturnReasonWidget(
                    reasonIndex: myReturnReason[index].id,
                    reasonIndexList: reasonIndex,
                    returnRequestReasonList: myReturnReason,
                    receiveQty: widget.receiveQty),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: myReturnReason.length);
  }
}
