import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/my_request.dart';
import 'widgets/filter_by_date_widget.dart';
import 'widgets/search_pending_request_widget.dart';

class RequestHistoryScreen extends ConsumerStatefulWidget {
  final List<MyRequest> pendingRequestList;
  const RequestHistoryScreen({super.key, required this.pendingRequestList});

  @override
  ConsumerState<RequestHistoryScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState
    extends ConsumerState<RequestHistoryScreen> {
  List<Map<String, dynamic>> requestedHistoryList = [];
  Map<String, dynamic> requestedHistoryMap = {};
  List<String> visibleCode = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRequestHistory();
  }

  loadRequestHistory() {
    requestedHistoryList.clear();
    for (var data in widget.pendingRequestList) {
      for (var element in data.productLineList) {
        if (element.status.contains("done") && !element.isReturn) {
          setState(() {
            String date = data.createDate.substring(0, 10);
            String warehouseName = data.requestToWh[1];
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
                "Request History",
                () {
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
                        textWidget("To"),
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
                                padding: !visibleCode.contains(productLineKey)
                                    ? EdgeInsets.zero
                                    : const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
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
                                      child: eachHistoryWidget(
                                          productList[subIndex]),
                                    );
                                  },
                                ),
                              ),
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
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(product.code, size: 14, color: Colors.black),
              const SizedBox(width: 10),
              SizedBox(
                  width: 58.w,
                  child: textWidget(product.productIdList[1],
                      size: 14, textAlign: TextAlign.left)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                "Request Qty : ${product.qty.toInt()} pc",
                color: AppColor.pinkColor,
                fontWeight: FontWeight.w700,
                size: 17,
              ),
              textWidget(
                "Issued Qty : ${product.issueQty.toInt()} pc",
                color: AppColor.pinkColor,
                fontWeight: FontWeight.w700,
                size: 17,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
