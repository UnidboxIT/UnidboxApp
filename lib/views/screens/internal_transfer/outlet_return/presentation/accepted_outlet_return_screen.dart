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
import '../../outlet_request/domain/other_request.dart';
import '../../outlet_request/domain/warehouse.dart';
import '../../outlet_request/presentation/widgets/search_other_request_widget.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import '../repository/provider/outlet_return_provider.dart';
import '../repository/state/outlet_return_state.dart';
import 'widgets/each_outlet_return_receive_widget.dart';

class AcceptedOutletReturnScreen extends ConsumerStatefulWidget {
  const AcceptedOutletReturnScreen({super.key});

  @override
  ConsumerState<AcceptedOutletReturnScreen> createState() =>
      _AcceptedOutletReturnScreenState();
}

class _AcceptedOutletReturnScreenState
    extends ConsumerState<AcceptedOutletReturnScreen> {
  List<Warehouse> warehouseList = [];
  int selectedWarehouseID = 0;
  List<Map<int, dynamic>> requestedMapList = [];
  Map<int, dynamic> requestedMap = {};
  bool requestLoading = false;
  List<OtherRequest> otherRequestList = [];
  List<ProductLineId> acceptedOutletReturnList = [];
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
      ref.read(outletReturnStateNotifier.notifier).getAlloutletReturn();
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
      ref.read(currentRouteProvider.notifier).state = '/outletreturn';
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
          List<Warehouse> whList = next.warehouseList;
          for (var data in whList) {
            if (data.id != userWarehouse.warehouseList[0]) {
              warehouseList.add(data);
            }
          }
        });
      }
    });
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
          requestedMap.clear();
          requestedMapList.clear();
          acceptedOutletReturnList.clear();
          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == "return_accepted") {
                int warehouseId = element.warehouseList[0];
                String warehouseName = element.warehouseList[1];
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
                  requestedMap[warehouseId]['product_line']
                      [productLineKey] = [];
                }
                requestedMap[warehouseId]['product_line'][productLineKey]
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
      if (next is ReceiveLoading) {
        setState(() {
          acceptLoading = true;
        });
      }
      if (next is ReturnReceivedProductID) {
        setState(() {
          acceptProductID = next.productID;
        });
      }
      if (next is OutletReturnError) {
        acceptLoading = false;
      }
    });

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
                "Accepted List",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Positioned(
                right: 2.w,
                top: 8.h,
                child: GestureDetector(
                  onTap: () {
                    ref.read(bottomBarVisibilityProvider.notifier).state =
                        false;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const GlobalReturnHistoryScreen()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 20.w,
                    height: 40,
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                    child: const Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: outletReturnWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget outletReturnWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOtherRequestWidget(),
          Expanded(
            child: Column(
              children: [
                warehouseWidget(),
                const SizedBox(height: 15),
                Expanded(
                  child: requestedMap[selectedWarehouseID] != null ||
                          selectedWarehouseID == -1
                      ? outletReturnReceiveWidget(requestedMapList)
                      : Center(
                          child: textWidget("No Data !"),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget outletReturnReceiveWidget(
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
                                productLineMap[productLineKey];

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
                                          child: eachOutletReturnWidget(
                                              productLineKey,
                                              warehouseData['warehouse_name'],
                                              warehouseData['date'],
                                              warehouseData['name'],
                                              productList,
                                              ref,
                                              context,
                                              isAcceptLoading: acceptLoading,
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
                  // ListView.separated(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: productLineMap.keys.length,
                  //     separatorBuilder: (context, index) {
                  //       return const SizedBox(height: 0);
                  //     },
                  //     itemBuilder: (context, productIndex) {
                  //       String productLineKey =
                  //           productLineMap.keys.elementAt(productIndex);
                  //       List<dynamic> productList =
                  //           productLineMap[productLineKey] ?? [];
                  //       return ListView.separated(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         itemCount: productList.length,
                  //         separatorBuilder: (context, index) {
                  //           return const SizedBox(height: 0);
                  //         },
                  //         itemBuilder: (context, subIndex) {
                  //           return eachOutletReturnWidget(
                  //             productLineKey,
                  //             warehouseData['name'],
                  //             warehouseData['date'],
                  //             productList[subIndex],
                  //             ref,
                  //             context,
                  //             isAcceptLoading: acceptLoading,
                  //             acceptProductID: acceptProductID,
                  //           );
                  //         },
                  //       );
                  //  },
                  //  );
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