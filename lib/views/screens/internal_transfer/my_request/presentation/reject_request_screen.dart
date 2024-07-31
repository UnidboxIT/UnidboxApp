import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../inventory_tracker/repository/provider/inhouse_stock_provider.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../domain/my_request.dart';
import '../repository/provider/my_request_provider.dart';
import '../repository/state/my_request_state.dart';
import 'insufficient_rejected_request_bottomsheet/insufficient_rejected_request_bottomsheet.dart';
import 'widgets/filter_by_date_widget.dart';
import 'widgets/search_pending_request_widget.dart';

class RejectRequestScreen extends ConsumerStatefulWidget {
  const RejectRequestScreen({super.key});

  @override
  ConsumerState<RejectRequestScreen> createState() => _RejectListScreenState();
}

class _RejectListScreenState extends ConsumerState<RejectRequestScreen> {
  List<MyRequest> rejectRequestList = [];
  int acceptProductID = -1;
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;
  bool myRequestLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestLoading) {
        setState(() {
          myRequestLoading = true;
        });
      }
      if (next is MyRequestList) {
        rejectRequestList = [];
        setState(() {
          rejectRequestList = next.myRequestList;
          acceptProductID = -1;
          myRequestLoading = false;
        });
      }
      if (next is ReceivedProductID) {
        setState(() {
          acceptProductID = next.productID;
          superPrint(acceptProductID);
        });
      }
      if (next is MyRequestError) {
        setState(() {
          acceptProductID = -1;
          myRequestLoading = false;
        });
      }
    });
    ref.listen(userWarehouseStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          isWarehouseLoading = true;
        });
      }
      if (next is UserWarehouseData) {
        setState(() {
          userWarehouse = next.warehouse;
          isWarehouseLoading = false;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Rejected Request",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: rejectedRequestWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rejectedRequestWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          filterByDateWidget(),
          const SearchPendingRequestWidget(),
          Expanded(child: rejectedRequestListWidget()),
        ],
      ),
    );
  }

  Widget rejectedRequestListWidget() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        List<ProductLineId> productList =
            rejectRequestList[index].productLineList.where((productLine) {
          return productLine.status == "rejected" ||
              (productLine.qty > productLine.issueQty &&
                      productLine.status == "accepted") &&
                  !productLine.removeReject;
        }).toList();
        superPrint(productList);
        String requestWarehouse = rejectRequestList[index].requestToWh.isEmpty
            ? ""
            : rejectRequestList[index].requestToWh[1];
        int requestWarehouseID = rejectRequestList[index].requestToWh.isEmpty
            ? 0
            : rejectRequestList[index].requestToWh[0];
        if (productList.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            eachProductLineWidget(
                requestWarehouse, productList, requestWarehouseID),
            const SizedBox(height: 20)
          ],
        );
      },
      itemCount: rejectRequestList.length,
    );
  }

  Widget eachProductLineWidget(String requestWh,
      List<ProductLineId> productList, int requestWarehouseID) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productList.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 2.h);
        },
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                        )
                      ]),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 0.8.h, bottom: 4.h),
                  child: textWidget(
                      "$requestWh unable to fulfilled all your request",
                      color: AppColor.primary,
                      size: 11.5,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                  color: Colors.transparent,
                  child: Transform.translate(
                    offset: Offset(0, 1.h),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: productList[index].imageUrl != "false"
                                      ? NetworkImage(
                                          productList[index].imageUrl)
                                      : const AssetImage(
                                          'assets/images/app_icon.jpeg'),
                                  fit: BoxFit.contain),
                            ),
                            height: 13.h,
                            width: 22.w,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(productList[index].productIdList[1],
                                    size: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    textOverflow: TextOverflow.fade,
                                    textAlign: TextAlign.left),
                                textWidget(productList[index].code,
                                    size: 12,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                                productList[index].model == "false"
                                    ? const SizedBox.shrink()
                                    : textWidget(
                                        productList[index].model,
                                        fontWeight: FontWeight.w500,
                                        size: 12,
                                      ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget(
                                      "Request Qty : ${productList[index].qty.toInt()} ${productList[index].productUomList[1]}",
                                      size: 11,
                                    ),
                                    textWidget(
                                      "Accepted Qty : ${productList[index].issueQty.toInt()} ${productList[index].productUomList[1]}",
                                      size: 11,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                textWidget(
                                  "Request the remaining quantity from other outlet?",
                                  color: AppColor.primary,
                                  size: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                                textWidget(
                                  "Remaining Qty : ${productList[index].qty.toInt() - productList[index].issueQty.toInt()} ${productList[index].productUomList[1]}",
                                  size: 11,
                                  color: AppColor.primary,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 27.w,
                                      height: 30,
                                      child: buttonWidget(
                                        "Remove",
                                        () {
                                          myRequestLoading &&
                                                  productList[index].id ==
                                                      acceptProductID
                                              ? () {}
                                              : ref
                                                  .read(
                                                      myRequestStateNotifierProvider
                                                          .notifier)
                                                  .removeRejectProduct(
                                                      productList[index].id,
                                                      context);
                                        },
                                        isBool: myRequestLoading &&
                                            acceptProductID ==
                                                productList[index].id,
                                        elevation: 0.5,
                                        fontSize: 13,
                                        fontColor: AppColor.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 27.w,
                                      height: 30,
                                      child: buttonWidget(
                                        "Request",
                                        () {
                                          ref
                                              .read(bottomBarVisibilityProvider
                                                  .notifier)
                                              .state = false;
                                          ref
                                              .read(
                                                  inhouseStockStateNotifierProvider
                                                      .notifier)
                                              .getInHouseStock(
                                                productList[index]
                                                    .productIdList[0],
                                                context,
                                              );
                                          showInsufficientRejectedRequestBottomsheet(
                                                  productList[index]
                                                      .productIdList[0]
                                                      .toString(),
                                                  context,
                                                  productList[index],
                                                  userWarehouse,
                                                  requestWh,
                                                  requestWarehouseID)
                                              .then((_) {
                                            ref
                                                .read(
                                                    myRequestStateNotifierProvider
                                                        .notifier)
                                                .getAllMyRequest();
                                            ref
                                                .read(
                                                    bottomBarVisibilityProvider
                                                        .notifier)
                                                .state = true;
                                          });
                                        },
                                        elevation: 0.5,
                                        fontSize: 13,
                                        fontColor: AppColor.primary,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
