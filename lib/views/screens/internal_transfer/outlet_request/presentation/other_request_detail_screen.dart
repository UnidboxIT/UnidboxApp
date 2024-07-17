import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/warehouse.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/warehouse_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/presentation/accepted_list_screen.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/other_request_state.dart';
import 'package:unidbox_app/views/widgets/load_more_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../my_request/domain/my_request.dart';
import 'other_request_history/other_request_history_screen.dart';
import 'outlet_request_breadcumbs_heacline/outlet_request_breadcrumbs_headline_widget.dart';
import 'widgets/each_other_request_product_widget.dart';
import 'widgets/search_other_request_widget.dart';

class OtherRequestDetailScreen extends ConsumerStatefulWidget {
  const OtherRequestDetailScreen({super.key});

  @override
  ConsumerState<OtherRequestDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<OtherRequestDetailScreen> {
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
  int selectedWarehouseID = 0;
  Map<int, dynamic> requestedMap = {};
  List<Map<int, dynamic>> requestedMapList = [];
  int acceptProductID = -1;
  bool acceptLoading = false;
  bool isWarehouseLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();

  @override
  void initState() {
    super.initState();
    ref.read(acceptedStateNotifierProvider.notifier).clearOtherRequestMap();
    Future.delayed(const Duration(milliseconds: 10), () async {
      await ref
          .read(userWarehouseStateNotifierProvider.notifier)
          .getUserWarehouse()
          .then((_) {
        ref.read(warehouseStateNotifierProvider.notifier).getAllWarehouse();
      });
      ref
          .read(outletRejectReasonStateNotifierProvider.notifier)
          .getOutletRejectReason();
    });
    _loadProducts(0);
  }

  void _loadProducts(int offset) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(currentRouteProvider.notifier).state = '/outletRequest';
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
    ref.listen(warehouseStateNotifierProvider, (pre, next) {
      if (next is WarehouseLoading) {
        setState(() {
          warehouseList = [];
        });
      }
      if (next is WarehouseList) {
        setState(() {
          for (var data in next.warehouseList) {
            if (data.id != userWarehouse.warehouseList[0]) {
              warehouseList.add(data);
            }
          }
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
          // requestedMap.clear();
          requestedMapList.clear();
          requestedMap.forEach((key, value) {
            value['product_line'] = {};
          });

          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == 'accepted') {
                acceptProductList.add(element);
              }
              if (element.status == "requested") {
                int warehouseId = element.warehouseList[0];
                String warehouseName = element.warehouseList[1];
                String productLineKey = data.name;
                if (!requestedMap.containsKey(warehouseId)) {
                  requestedMap[warehouseId] = {
                    "warehouse_name": warehouseName,
                    "name": data.userId[1],
                    "date": data.createDate,
                    "product_line": {}
                  };
                }
                // Ensure each product line is unique per warehouse
                if (!requestedMap[warehouseId]['product_line']
                    .containsKey(productLineKey)) {
                  requestedMap[warehouseId]['product_line']
                      [productLineKey] = [];
                }
                requestedMap[warehouseId]['product_line'][productLineKey]
                    .add(element);
              }
            }
          }
          if (requestedMap.isNotEmpty) {
            if (requestedMap.keys.contains(selectedWarehouseID)) {
              superPrint(selectedWarehouseID);
              selectedWarehouseID = selectedWarehouseID;
            } else {
              superPrint(selectedWarehouseID);
              selectedWarehouseID = requestedMap.keys.first;
              superPrint(requestedMap.keys.first);
            }
            requestedMapList
                .add({selectedWarehouseID: requestedMap[selectedWarehouseID]});
            // requestedMapList.add(requestedMap);
          }
          acceptLoading = false;
        });
      }

      if (next is IsDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
      if (next is AcceptLoading) {
        setState(() {
          acceptLoading = true;
        });
      }
      if (next is AcceptProductID) {
        setState(() {
          acceptProductID = next.productID;
        });
      }
      if (next is Error) {
        setState(() {
          acceptLoading = false;
        });
      }

      // if (next is SearchOtherRequestList) {
      //   setState(() {
      //     otherRequestList = [];
      //     acceptProductList.clear();
      //     otherRequestList = next.searchOtherRequestList;
      //   });
      //   superPrint(otherRequestList);
      // }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (_) =>
              ref.read(currentRouteProvider.notifier).state = '/',
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Outlet Requests",
                  () {
                    ref.read(currentRouteProvider.notifier).state = '/';
                    Navigator.of(context).pop();
                  },
                ),
                Transform.translate(
                  offset: Offset(65.w, 6.h),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          false;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const OtherRequestHistoryScreen()));
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
      ),
    );
  }

  Widget otherRequestWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchOtherRequestWidget(),
          outletRequestBreadcrumbHeadline(context, "", ""),
          Expanded(child: myrequestDetailWidget()),
        ],
      ),
    );
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
        acceptRequestWidget(),
        const SizedBox(height: 15),
        warehouseWidget(),
        isWarehouseLoading
            ? const SizedBox.shrink()
            : Expanded(
                child: requestedMap[selectedWarehouseID] != null ||
                        selectedWarehouseID == -1
                    ? acceptedProductLineWidget(requestedMapList)
                    : Center(
                        child: textWidget("No Data !"),
                      ),
              ),
        if (xLoading) loadMoreWidget(),
        SizedBox(
          height: 4.h,
        )
      ],
    );
  }

  Widget acceptedProductLineWidget(
    List<Map<int, dynamic>> requestedMapList,
  ) {
    return requestedMapList.isEmpty
        ? Center(
            child: textWidget("No Data !"),
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            physics: const ClampingScrollPhysics(),
            itemCount: requestedMapList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 0);
            },
            itemBuilder: (context, index) {
              Map<int, dynamic> warehouseMap = requestedMapList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: warehouseMap.entries.map((entry) {
                  // int warehouseId = entry.key;
                  Map<dynamic, dynamic> warehouseData = entry.value;
                  Map<dynamic, dynamic> productLineMap =
                      warehouseData['product_line'];
                  return productLineMap.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: 50.h,
                          child: textWidget("No Data !"),
                        )
                      : ListView.separated(
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
                                productLineMap[productLineKey] ?? [];
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: productList.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 0);
                              },
                              itemBuilder: (context, subIndex) {
                                return eachAcceptedDataWiget(
                                  productLineKey,
                                  warehouseData['name'],
                                  warehouseData['date'],
                                  productList[subIndex],
                                  ref,
                                  isAcceptLoading: acceptLoading,
                                  acceptProductID: acceptProductID,
                                );
                              },
                            );
                          },
                        );
                }).toList(),
              );
            },
          );
  }

  Widget warehouseWidget() {
    return Container(
      height: 5.5.h,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 5),
        children: [
          ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWarehouseID = warehouseList[index].id;
                      if (requestedMap[selectedWarehouseID] != null) {
                        Map<String, dynamic> value =
                            requestedMap[selectedWarehouseID] ?? {};
                        requestedMapList.clear();
                        if (requestedMap.containsKey(selectedWarehouseID)) {
                          requestedMap[selectedWarehouseID] = {
                            "warehouse_name": value['warehouse_name'],
                            "name": value['name'],
                            "date": value['date'],
                            "product_line": value['product_line']
                          };
                        }
                        requestedMapList.add({
                          selectedWarehouseID: requestedMap[selectedWarehouseID]
                        });
                      } else {
                        setState(() {
                          requestedMap.remove(selectedWarehouseID);
                        });
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
          const SizedBox(width: 10),
          warehouseList.isEmpty
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWarehouseID = -1;
                      requestedMapList.clear();
                      if (requestedMap.isNotEmpty) {
                        requestedMapList.add(requestedMap);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selectedWarehouseID == -1
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
                    child: textWidget("All",
                        color: selectedWarehouseID == -1
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
        ],
      ),
    );
  }

  Widget acceptRequestWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AcceptedListScreen(
              otherRequestList: otherRequestList,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.bottomSheetBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    "Accepted List".toUpperCase(),
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: acceptProductList.isNotEmpty,
              child: Positioned(
                top: -15,
                right: -10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.pinkColor,
                  child: textWidget(
                    acceptProductList.length.toString(),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
