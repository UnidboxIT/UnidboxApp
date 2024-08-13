import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/presentation/other_request_history/packed_product_history_screen.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/presentation/widgets/search_pending_request_widget.dart';
import '../../domain/other_request.dart';
import '../../repository/provider/other_request_provider.dart';
import '../../repository/state/other_request_state.dart';
import 'accepted_product_history_screen.dart';

class OtherRequestHistoryScreen extends ConsumerStatefulWidget {
  const OtherRequestHistoryScreen({super.key});

  @override
  ConsumerState<OtherRequestHistoryScreen> createState() =>
      _PendingRequestListScreenState();
}

class _PendingRequestListScreenState
    extends ConsumerState<OtherRequestHistoryScreen> {
  List<Map<String, dynamic>> requestedHistoryList = [];
  List<Map<String, dynamic>> acceptedHistoryList = [];
  List<Map<String, dynamic>> packedHistoryList = [];
  Map<String, dynamic> requestedHistoryMap = {};
  Map<String, dynamic> acceptedHistoryMap = {};
  Map<String, dynamic> packedHistoryMap = {};
  List<String> visibleCode = [];
  List<OtherRequest> otherRequestList = [];
  bool requestLoading = false;
  String historyText = "";
  List<Map<String, dynamic>> dateFilteredData = [];
  List<Map<String, dynamic>> acceptedDateFilteredData = [];
  List<Map<String, dynamic>> packedDateFilteredData = [];
  String selectedDateRange = "";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
    setState(() {
      historyText = "accepted";
      selectedDateRange =
          "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
    });
  }

  loadRequestHistory() {
    requestedHistoryMap.clear();
    acceptedHistoryMap.clear();
    packedHistoryMap.clear();
    acceptedHistoryList.clear();
    requestedHistoryList.clear();
    packedHistoryList.clear();
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status == "accepted") {
          setState(() {
            String date = data.createDate.substring(0, 10);
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!acceptedHistoryMap.containsKey(date)) {
              acceptedHistoryMap[date] = {
                "id": data.id,
                "date": data.createDate,
                "product_line": {}
              };
            }
            // Ensure each product line is unique per warehouse
            if (!acceptedHistoryMap[date]['product_line']
                .containsKey(productLineKey)) {
              acceptedHistoryMap[date]['product_line'][productLineKey] = {
                "warehouse_name": warehouseName,
                "products": []
              };
            }
            acceptedHistoryMap[date]['product_line'][productLineKey]['products']
                .add(element);
          });
        }
        if (element.status == "done" || element.status == "receiving") {
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

        if (element.status == "packed") {
          setState(() {
            String date = data.createDate.substring(0, 10);
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!packedHistoryMap.containsKey(date)) {
              packedHistoryMap[date] = {
                "id": data.id,
                "date": data.createDate,
                "product_line": {}
              };
            }
            // Ensure each product line is unique per warehouse
            if (!packedHistoryMap[date]['product_line']
                .containsKey(productLineKey)) {
              packedHistoryMap[date]['product_line'][productLineKey] = {
                "warehouse_name": warehouseName,
                "products": []
              };
            }
            packedHistoryMap[date]['product_line'][productLineKey]['products']
                .add(element);
          });
        }
      }
    }

    if (requestedHistoryMap.isNotEmpty) {
      setState(() {
        superPrint(requestedHistoryMap);
        dateFilteredData.clear();
        requestedHistoryList.add(requestedHistoryMap);
        dateFilteredData.add(requestedHistoryMap);
        superPrint(dateFilteredData);
      });
    }
    if (acceptedHistoryMap.isNotEmpty) {
      setState(() {
        acceptedDateFilteredData.clear();
        acceptedHistoryList.add(acceptedHistoryMap);
        acceptedDateFilteredData.add(acceptedHistoryMap);
        superPrint(dateFilteredData);
      });
    }
    if (packedHistoryMap.isNotEmpty) {
      setState(() {
        packedDateFilteredData.clear();
        packedHistoryList.add(packedHistoryMap);
        packedDateFilteredData.add(packedHistoryMap);
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

  List<Map<String, dynamic>> filterDataByDateRange(
      List<Map<String, dynamic>> data, DateTime startDate, DateTime endDate) {
    superPrint(startDate);
    superPrint(endDate);
    return data
        .map((entry) {
          Map<String, dynamic> filteredEntry = {};
          entry.forEach((keyDate, value) {
            DateTime date = DateTime.parse(keyDate);
            if (date.isAtSameMomentAs(startDate) ||
                date.isAtSameMomentAs(endDate) ||
                (date.isAfter(startDate) && date.isBefore(endDate))) {
              filteredEntry[keyDate] = value;
            }
          });
          return filteredEntry;
        })
        .where((filteredEntry) => filteredEntry.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          requestLoading = true;
          otherRequestList = [];
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
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
                  historyText == "accepted"
                      ? "Accepted History"
                      : historyText == "packed"
                          ? "Packed History"
                          : "Issued History",
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
          dateFilterWidget(),
          // filterByDateWidget(context),
          const SearchPendingRequestWidget(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.category_rounded,
                        color: AppColor.pinkColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          historyText = "accepted";
                          startDate = DateTime.now();
                          endDate = DateTime.now();
                          selectedDateRange =
                              "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
                          acceptedDateFilteredData.clear();
                          acceptedDateFilteredData.add(acceptedHistoryMap);
                        });
                      },
                      child: textWidget("Accepted\nHistroy",
                          color: historyText == "accepted"
                              ? AppColor.primary
                              : AppColor.pinkColor,
                          fontWeight: FontWeight.bold,
                          size: 14,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          historyText = "packed";
                          startDate = DateTime.now();
                          endDate = DateTime.now();
                          selectedDateRange =
                              "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
                          packedDateFilteredData.clear();
                          packedDateFilteredData.add(packedHistoryMap);
                        });
                      },
                      child: textWidget("Packed\nHistory",
                          color: historyText == "packed"
                              ? AppColor.primary
                              : AppColor.pinkColor,
                          fontWeight: FontWeight.w800,
                          size: 14,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          historyText = "issued";
                          startDate = DateTime.now();
                          endDate = DateTime.now();
                          selectedDateRange =
                              "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
                          dateFilteredData.clear();
                          dateFilteredData.add(requestedHistoryMap);
                        });
                      },
                      child: textWidget("Issued\nHistory",
                          color: historyText == "issued"
                              ? AppColor.primary
                              : AppColor.pinkColor,
                          fontWeight: FontWeight.w800,
                          size: 14,
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
          requestLoading
              ? Expanded(
                  child: Center(
                    child: CupertinoActivityIndicator(
                      color: AppColor.primary,
                    ),
                  ),
                )
              : Expanded(
                  child: historyText == "accepted"
                      ? AcceptedProductHistoryScreen(
                          requestedHistoryList: acceptedDateFilteredData
                          //acceptedHistoryList
                          )
                      : historyText == "packed"
                          ? PackedProductHistoryScreen(
                              requestedHistoryList: packedDateFilteredData
                              //packedHistoryList,
                              )
                          : requestHistoryWidget(),
                ),
        ],
      ),
    );
  }

  Widget requestHistoryWidget() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const ClampingScrollPhysics(),
      itemCount: dateFilteredData.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
      itemBuilder: (context, index) {
        Map<String, dynamic> warehouseMap = dateFilteredData[index];
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
                        textWidget("Request From"),
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
                                                            "done" ||
                                                        productList[subIndex]
                                                                .status ==
                                                            "receiving"
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
                                            left: -6.w,
                                            child: Transform.rotate(
                                              angle: 80.1,
                                              child: textWidget("ISSUED",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              "Attribute ",
              fontWeight: FontWeight.w700,
              color: AppColor.pinkColor,
            ),
            const SizedBox(width: 5),
            product.productIdList[5] == []
                ? textWidget("")
                : Expanded(
                    child: Wrap(
                      children: attributeTexts,
                    ),
                  )
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.pinkColor.withOpacity(0.2)),
                  child: textWidget(
                    "Request Qty : ${product.qty.toInt()} ${product.productUomList[1]}",
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    size: 13.5,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.pinkColor.withOpacity(0.2)),
                  child: textWidget(
                    "Issued Qty : ${product.issueQty.toInt()} ${product.productUomList[1]}",
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    size: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget dateFilterWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 45,
        width: 100.w,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColor.dropshadowColor,
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget("Filter date", color: Colors.grey.shade400, size: 13),
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      insetPadding: const EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: getDateRangePicker(dialogContext),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.transparent,
                width: 20.w,
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.calendar_month_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getDateRangePicker(BuildContext dialogContext) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SfDateRangePicker(
        backgroundColor: Colors.white,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: selectionChanged,
        initialSelectedRange: PickerDateRange(startDate, endDate),
        showActionButtons: true,
        onSubmit: (value) {
          Navigator.of(dialogContext).pop();
        },
        onCancel: () {
          setState(() {
            startDate = DateTime.now();
            endDate = DateTime.now();
            selectedDateRange =
                "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
            Navigator.of(dialogContext).pop();
          });
          superPrint(selectedDateRange);
        },
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectedDateRange =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      superPrint(selectedDateRange);
      List<String> selectedDates = selectedDateRange.split(' - ');
      startDate = DateFormat('dd/MM/yyyy').parse(selectedDates[0]);
      endDate = DateFormat('dd/MM/yyyy').parse(selectedDates[1]);
      dateFilteredData.clear();
      acceptedDateFilteredData.clear();
      packedDateFilteredData.clear();
      if (historyText == "accepted") {
        acceptedDateFilteredData =
            filterDataByDateRange(acceptedHistoryList, startDate, endDate);
      } else if (historyText == "packed") {
        packedDateFilteredData =
            filterDataByDateRange(packedHistoryList, startDate, endDate);
      } else {
        superPrint(requestedHistoryList);
        dateFilteredData =
            filterDataByDateRange(requestedHistoryList, startDate, endDate);
      }
    });
  }
}
