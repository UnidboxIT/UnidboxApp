import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/other_request_state.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../my_request/domain/my_request.dart';
import '../../my_request/repository/state/warehouse_state.dart';
import '../../outlet_request/domain/warehouse.dart';
import '../../outlet_request/presentation/widgets/search_other_request_widget.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import 'widgets/each_outlet_return_receive_widget.dart';

class OutletReturnScreen extends ConsumerStatefulWidget {
  const OutletReturnScreen({super.key});

  @override
  ConsumerState<OutletReturnScreen> createState() => _OutletReturnScreenState();
}

class _OutletReturnScreenState extends ConsumerState<OutletReturnScreen> {
  List<Warehouse> warehouseList = [];
  int selectedWarehouseID = -1;
  List<Map<int, dynamic>> requestedMapList = [];
  Map<int, dynamic> requestedMap = {};
  bool requestLoading = false;
  List<OtherRequest> otherRequestList = [];
  Map<String, List<ProductLineId>> requestProductLineMap = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(warehouseStateNotifierProvider.notifier).getAllWarehouse();
      ref.read(otherRequestStateNotifierProvider.notifier).getAllOtherRequest();
    });
  }

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
          List<Warehouse> whList = next.warehouseList;
          for (var data in whList) {
            if (data.id != admin.warehouseMap[0]) {
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
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          requestProductLineMap.clear();
          requestedMap.clear();
          requestedMapList.clear();
          for (var data in otherRequestList) {
            for (var element in data.productLineList) {
              if (element.status == "returned") {
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
            requestedMapList.add(requestedMap);
          }
        });
      }
      // if (next is AcceptLoading) {
      //   setState(() {
      //     acceptLoading = true;
      //   });
      // }
      // if (next is AcceptProductID) {
      //   setState(() {
      //     acceptProductID = next.productID;
      //   });
      // }
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
                "Outlet Return",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(65.w, 6.h),
                child: GestureDetector(
                  onTap: () {},
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
                    child: textWidget(
                      "Returned\nHistory",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      size: 17,
                      textAlign: TextAlign.center,
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
      height: 81.h,
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
                  return ListView.separated(
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
                          return eachOutletReturnWidget(
                            productLineKey,
                            warehouseData['name'],
                            warehouseData['date'],
                            productList[subIndex],
                            ref,
                            // isAcceptLoading: acceptLoading,
                            // acceptProductID: acceptProductID,
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
          const SizedBox(width: 10),
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
        ],
      ),
    );
  }
}
