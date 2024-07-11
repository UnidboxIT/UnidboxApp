import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/presentation/widgets/filter_by_date_widget.dart';
import '../../../my_request/presentation/widgets/search_pending_request_widget.dart';
import '../../repository/provider/outlet_return_provider.dart';
import '../../repository/state/outlet_return_state.dart';

class OutletReturnHistoryScreen extends ConsumerStatefulWidget {
  const OutletReturnHistoryScreen({super.key});

  @override
  ConsumerState<OutletReturnHistoryScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState
    extends ConsumerState<OutletReturnHistoryScreen> {
  List<Map<String, dynamic>> requestedHistoryList = [];
  Map<String, dynamic> requestedHistoryMap = {};
  List<String> visibleCode = [];
  List<OtherRequest> otherRequestList = [];
  bool requestLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(outletReturnStateNotifier.notifier).getAlloutletReturn();
    });
  }

  loadRequestHistory() {
    requestedHistoryList.clear();
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status.contains("done") && element.isReturn) {
          setState(() {
            String date = data.createDate.substring(0, 10);
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!requestedHistoryMap.containsKey(date)) {
              requestedHistoryMap[date] = {
                "id": data.id,
                "date": data.createDate,
                "product_line": {}
              };
            }
            // Ensure each product line is unique per warehouse
            if (!requestedHistoryMap[date]['product_line']
                .containsKey(productLineKey)) {
              requestedHistoryMap[date]['product_line'][productLineKey] = {
                "warehouse_name": warehouseName,
                "products": []
              };
            }
            requestedHistoryMap[date]['product_line'][productLineKey]
                    ['products']
                .add(element);
          });
        }
      }
    }
    if (requestedHistoryMap.isNotEmpty) {
      setState(() {
        requestedHistoryList.add(requestedHistoryMap);
      });
    }
  }

  loadSetVisiblity(String code) {
    setState(() {
      visibleCode.add(code);
    });
  }

  removeVisiblity(String code) {
    setState(() {
      visibleCode.remove(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(outletReturnStateNotifier, (pre, next) {
      if (next is OutletReturnLoading) {
        setState(() {
          requestLoading = true;
          otherRequestList = [];
        });
      }
      if (next is OutletReturnList) {
        setState(() {
          otherRequestList = next.outletReturnList;
          loadRequestHistory();
          requestLoading = false;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Transfered History",
                  () {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                  },
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: pendingRequestWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pendingRequestWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          filterByDateWidget(),
          const SearchPendingRequestWidget(),
          Expanded(child: requestHistoryWidget(requestedHistoryList)),
        ],
      ),
    );
  }

  Widget requestHistoryWidget(
    List<Map<String, dynamic>> requestedMapList,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const ClampingScrollPhysics(),
      itemCount: requestedMapList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
      itemBuilder: (context, index) {
        Map<String, dynamic> warehouseMap = requestedMapList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: warehouseMap.entries.map((entry) {
            String date = entry.key;
            Map<dynamic, dynamic> warehouseData = entry.value;
            Map<dynamic, dynamic> productLineMap =
                warehouseData['product_line'];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 4.h),
                    decoration: BoxDecoration(
                      color: AppColor.pinkColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(date)),
                          size: 14,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        textWidget("Returned From"),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -3.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productLineMap.keys.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 0);
                        },
                        itemBuilder: (context, productIndex) {
                          String productLineKey =
                              productLineMap.keys.elementAt(productIndex);
                          List<dynamic> productList =
                              productLineMap[productLineKey]['products'] ?? [];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (visibleCode.contains(productLineKey)) {
                                    removeVisiblity(productLineKey);
                                  } else {
                                    loadSetVisiblity(productLineKey);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: visibleCode
                                              .contains(productLineKey)
                                          ? [
                                              BoxShadow(
                                                  color:
                                                      AppColor.dropshadowColor,
                                                  blurRadius: 3,
                                                  spreadRadius: 3)
                                            ]
                                          : []),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget(
                                        productLineKey,
                                        size: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textWidget(
                                        productLineMap[productLineKey]
                                            ['warehouse_name'],
                                        size: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: visibleCode.contains(productLineKey),
                                  child: const SizedBox(height: 10)),
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: productList.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 0);
                                  },
                                  itemBuilder: (context, subIndex) {
                                    return Visibility(
                                      visible:
                                          visibleCode.contains(productLineKey),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            left: -2.w,
                                            child: Container(
                                              height: 17.h,
                                              width: 5.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: productList[subIndex]
                                                            .status ==
                                                        "done"
                                                    ? AppColor.orangeColor
                                                    : Colors.grey.shade300,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  topLeft: Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: -9.w,
                                            child: Transform.rotate(
                                              angle: 80.1,
                                              child: textWidget("RETURNED",
                                                  size: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white,
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 0),
                                            child: eachHistoryWidget(
                                                productList[subIndex]),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // Container(
                              //   padding: !visibleCode.contains(productLineKey)
                              //       ? EdgeInsets.zero
                              //       : const EdgeInsets.symmetric(
                              //           horizontal: 15, vertical: 0),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(15),
                              //   ),
                              //   child: ListView.separated(
                              //     shrinkWrap: true,
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     itemCount: productList.length,
                              //     separatorBuilder: (context, index) {
                              //       return const SizedBox(height: 0);
                              //     },
                              //     itemBuilder: (context, subIndex) {
                              //       return Visibility(
                              //         visible:
                              //             visibleCode.contains(productLineKey),
                              //         child: eachHistoryWidget(
                              //             productList[subIndex]),
                              //       );
                              //     },
                              //   ),
                              // ),
                              Visibility(
                                  visible: visibleCode.contains(productLineKey),
                                  child: const SizedBox(height: 5))
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget eachHistoryWidget(ProductLineId product) {
    List<Widget> attributeTexts = [];
    for (int i = 0; i < product.productIdList[5].length; i++) {
      attributeTexts.add(Text(product.productIdList[5][i],
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          )));
      if (i != product.productIdList[5].length - 1) {
        attributeTexts.add(const Text(', ',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )));
      }
    }
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
              width: 100.w,
              child: textWidget(
                product.productIdList[4],
                size: 14,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
              )),
        ),
        Row(
          children: [
            textWidget(
              "Model ",
              fontWeight: FontWeight.w700,
              color: AppColor.pinkColor,
            ),
            const SizedBox(width: 15),
            textWidget(
              product.model == "false" ? "" : product.model,
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Row(
          children: [
            textWidget(
              "Attribute ",
              fontWeight: FontWeight.w700,
              color: AppColor.pinkColor,
            ),
            const SizedBox(width: 5),
            product.productIdList[5] == []
                ? textWidget("")
                : Row(children: attributeTexts)
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.pinkColor.withOpacity(0.2)),
                child: textWidget(
                  "Return Qty : ${product.issueQty.toInt() - product.receivedQty.toInt()} ${product.productUomList[1]}",
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  size: 13.5,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.pinkColor.withOpacity(0.2)),
                child: textWidget(
                  "Received Qty : ${product.issueQty.toInt() - product.receivedQty.toInt()} ${product.productUomList[1]}",
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  size: 13.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
