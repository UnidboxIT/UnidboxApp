import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/warehouse.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/warehouse_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/other_request_state.dart';
import 'package:unidbox_app/views/widgets/load_more_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../my_request/domain/my_request.dart';
import 'widgets/each_other_request_product_widget.dart';

class AcceptedDetailScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;
  final List<ProductLineId> requestProductList;
  final List<ProductLineId> acceptProductList;
  final List<Warehouse> warehouseList;
  const AcceptedDetailScreen(
      {super.key,
      required this.otherRequestList,
      required this.requestProductList,
      required this.acceptProductList,
      required this.warehouseList});

  @override
  ConsumerState<AcceptedDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<AcceptedDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  List<ProductLineId> acceptProductList = [];
  List<ProductLineId> requestProductList = [];
  List<Warehouse> warehouseList = [];
  List<ProductLineId> productByWarehouse = [];
  int offset = 0;
  bool requestLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  ScrollController scrollController = ScrollController();

  int selectedWarehouseID = -1;

  @override
  void initState() {
    super.initState();
    setState(() {
      warehouseList = widget.warehouseList;
      otherRequestList = widget.otherRequestList;
      requestProductList = widget.requestProductList;
      acceptProductList = widget.acceptProductList;
    });
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   ref.read(warehouseStateNotifierProvider.notifier).getAllWarehouse();
    // });
    // ref.read(otherRequestStateNotifierProvider.notifier).clearMyRequestValue();
    // scrollController.addListener(_scrollListener);
    // _loadProducts(0);
  }

  // void _loadProducts(int offset) {
  //   Future.delayed(const Duration(milliseconds: 10), () {
  //     ref
  //         .read(otherRequestStateNotifierProvider.notifier)
  //         .getAllOtherRequest(offset);
  //   });
  // }

  // void _scrollListener() async {
  //   if (scrollController.position.pixels >=
  //           scrollController.position.maxScrollExtent &&
  //       !xLoading) {
  //     if (isDataExist) {
  //       setState(() {
  //         xLoading = true;
  //       });
  //       offset += 10;
  //       superPrint("HERE $offset");
  //       _loadProducts(offset);
  //       await Future.delayed(const Duration(seconds: 1));
  //       setState(() {
  //         xLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ref.listen(warehouseStateNotifierProvider, (pre, next) {
      if (next is WarehouseLoading) {
        setState(() {
          warehouseList = [];
        });
      }
      if (next is WarehouseList) {
        setState(() {
          warehouseList = next.warehouseList;
        });
      }
    });
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          requestLoading = true;
          otherRequestList = [];
          requestProductList.clear();
          acceptProductList.clear();
          productByWarehouse = [];
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'requested') {
                // 'progress') {
                acceptProductList.add(element);
              }
              if (element.status == "requested") {
                requestProductList.add(element);
              }
            }
          }
          requestLoading = false;
        });
      }

      if (next is IsDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });
    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
        warehouseWidget(),
        const SizedBox(height: 15),
        requestLoading
            ? Expanded(
                child: CupertinoActivityIndicator(
                  color: AppColor.pinkColor,
                ),
              )
            : otherRequestList.isEmpty
                ? Center(
                    child: textWidget("No Data !"),
                  )
                : Expanded(
                    child: productByWarehouse.isEmpty &&
                            selectedWarehouseID != -1
                        ? Center(child: textWidget("No Data !"))
                        : ListView.separated(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 20),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String requestCode = otherRequestList[index].name;
                              String name = otherRequestList[index].userId[1];
                              //String status = otherRequestList[index].intStatus;
                              String currentDate =
                                  otherRequestList[index].createDate;
                              if (productByWarehouse.isNotEmpty) {
                                return eachOtherRequestProductLineWidget(
                                  requestCode,
                                  name,
                                  currentDate,
                                  productByWarehouse,
                                );
                              }
                              return eachOtherRequestProductLineWidget(
                                requestCode,
                                name,
                                currentDate,
                                requestProductList,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemCount: otherRequestList.length),
                  ),
        if (xLoading) loadMoreWidget(),
        Platform.isIOS && xLoading
            ? SizedBox(height: 3.h)
            : const SizedBox.shrink()
      ],
    );
  }

  Widget warehouseWidget() {
    return Container(
      height: 5.5.h,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedWarehouseID = warehouseList[index].id;
                  productByWarehouse.clear();
                  for (var data in requestProductList) {
                    if (selectedWarehouseID == data.warehouseList[0]) {
                      productByWarehouse.add(data);
                    }
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: selectedWarehouseID == warehouseList[index].id
                        ? AppColor.orangeColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(-2, 2),
                      )
                    ]),
                child: textWidget(warehouseList[index].name,
                    color: selectedWarehouseID == warehouseList[index].id
                        ? Colors.white
                        : Colors.black),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: warehouseList.length),
    );
  }
}
