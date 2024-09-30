import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../global_return_history/global_return_history_screen.dart';
import '../../my_request/repository/state/warehouse_state.dart';
import '../../outlet_request/domain/warehouse.dart';
import '../../outlet_request/presentation/widgets/search_other_request_widget.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import '../repository/provider/my_return_provider.dart';
import '../repository/state/my_return_state.dart';
import 'barcode_scanner_screen.dart';
import 'widgets/accepted_my_return_widget.dart';
import 'widgets/each_my_return_product_widget.dart';
import 'widgets/new_return_scan_search_bar_widget.dart';

class MyReturnScreen extends ConsumerStatefulWidget {
  const MyReturnScreen({super.key});

  @override
  ConsumerState<MyReturnScreen> createState() => _OutletReturnScreenState();
}

class _OutletReturnScreenState extends ConsumerState<MyReturnScreen> {
  List<Warehouse> warehouseList = [];
  int selectedWarehouseID = 0;
  List<Map<int, dynamic>> requestedMapList = [];
  Map<int, dynamic> requestedMap = {};
  bool requestLoading = false;
  List<MyRequest> myReturnList = [];
  List<ProductLineId> acceptedReturnList = [];
  int acceptProductID = -1;
  bool acceptLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;
  List<String> visibleCode = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () async {
      await ref
          .read(userWarehouseStateNotifierProvider.notifier)
          .getUserWarehouse()
          .then((_) {
        ref.read(warehouseStateNotifierProvider.notifier).getAllWarehouse();
      });
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myReturnStateNotifierProvider.notifier).getAllMyReturn();
    });
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(currentRouteProvider.notifier).state = '/myReturn';
    });
    ref.watch(myReturnStateNotifierProvider);
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
          List<Warehouse> whList = next.warehouseList;
          for (var data in whList) {
            // if (data.id != userWarehouse.warehouseList[0]) {
            warehouseList.add(data);
            // }
          }
        });
      }
    });
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
          requestLoading = true;
          myReturnList = [];
          acceptedReturnList.clear();
        });
      }
      if (next is MyReturnDataList) {
        setState(() {
          myReturnList = next.myReturnDataList;

          requestedMap.clear();
          requestedMapList.clear();
          for (var data in myReturnList) {
            for (var element in data.productLineList) {
              if (element.status == 'return_accepted') {
                acceptedReturnList.add(element);
              }
              if (element.status == "waiting_return_accept") {
                int warehouseId = data.isNewReturn
                    ? element.warehouseList[0]
                    : element.requestWarehouse[0];
                String warehouseName = data.isNewReturn
                    ? element.warehouseList[1]
                    : element.requestWarehouse[1];
                String productLineKey = data.name;
                if (!requestedMap.containsKey(warehouseId)) {
                  requestedMap[warehouseId] = {
                    "warehouse_name": warehouseName,
                    "name": data.userId[1],
                    "date": data.createDate,
                    "product_line": {},
                  };
                }
                if (!requestedMap[warehouseId]['product_line']
                    .containsKey(productLineKey)) {
                  requestedMap[warehouseId]['product_line'][productLineKey] = {
                    "is_return": data.isNewReturn,
                    "products": []
                  };
                }
                requestedMap[warehouseId]['product_line'][productLineKey]
                        ['products']
                    .add(element);
              }
            }
          }

          acceptLoading = false;
          requestLoading = false;
          if (requestedMap.isNotEmpty) {
            if (requestedMap.keys.contains(selectedWarehouseID)) {
              selectedWarehouseID = selectedWarehouseID;
            } else {
              selectedWarehouseID = requestedMap.keys.first;
            }
            requestedMapList
                .add({selectedWarehouseID: requestedMap[selectedWarehouseID]});
            //requestedMapList.add(requestedMap);
          }
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
              ref.read(currentRouteProvider.notifier).state = '/',
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "My Return",
                  () {
                    ref.read(currentRouteProvider.notifier).state = '/';
                    Navigator.of(context).pop();
                  },
                ),
                Positioned(
                  right: 5.w,
                  top: 6.5.h,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          txtSearchController.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const NewReturnBarCodeScannerScreen(),
                          ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(bottomBarVisibilityProvider.notifier).state =
                              false;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GlobalReturnHistoryScreen(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: const Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: myReturnWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myReturnWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOtherRequestWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                warehouseList.isEmpty
                    ? const SizedBox.shrink()
                    : warehouseWidget(),
                const SizedBox(height: 15),
                acceptedMyReturnWidget(acceptedReturnList, context),
                const SizedBox(height: 10),
                Expanded(
                  child: requestedMap[selectedWarehouseID] != null ||
                          selectedWarehouseID == -1
                      ? myReturnDataWidget(requestedMapList)
                      : warehouseList.isEmpty
                          ? const SizedBox.shrink()
                          : Center(
                              child: textWidget("No Data !"),
                            ),
                ),
              ],
            ),
          ),
          Container(
            height: 5.h,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget myReturnDataWidget(
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
                                productLineMap[productLineKey]['products'];

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.dropshadowColor
                                          .withOpacity(0.02),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (visibleCode
                                                .contains(productLineKey)) {
                                              removeVisiblity(productLineKey);
                                            } else {
                                              loadSetVisiblity(productLineKey);
                                            }
                                          },
                                          child: Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColor.bottomSheetBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.03),
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 3)
                                                ]),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                textWidget(
                                                  productLineKey,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                textWidget(
                                                    DateFormat('dd MMM yyyy')
                                                        .format(
                                                      DateTime.parse(
                                                          warehouseData[
                                                              'date']),
                                                    ),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    size: 17)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: visibleCode
                                              .contains(productLineKey),
                                          child: const SizedBox(height: 13),
                                        ),
                                        Visibility(
                                          visible: visibleCode
                                              .contains(productLineKey),
                                          child: eachMyReturnProductLineWidget(
                                              productLineKey,
                                              warehouseData['warehouse_name'],
                                              warehouseData['date'],
                                              productLineMap[productLineKey]
                                                  ['is_return'],
                                              productList,
                                              acceptProductID: acceptProductID),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20)
                              ],
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
          GestureDetector(
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
                  color:
                      selectedWarehouseID == -1 ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
