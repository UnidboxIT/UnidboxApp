import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../my_request/domain/my_request.dart';
import '../../my_request/presentation/widgets/search_pending_request_widget.dart';
import '../../my_request/repository/state/warehouse_state.dart';
import '../../outlet_request/domain/warehouse.dart';
import '../../outlet_request/repository/provider/other_request_provider.dart';
import '../repository/provider/my_return_provider.dart';
import '../repository/state/my_return_state.dart';
import 'widgets/accepted_my_return_widget.dart';

class MyReturnDetailScreen extends ConsumerStatefulWidget {
  const MyReturnDetailScreen({super.key});

  @override
  ConsumerState<MyReturnDetailScreen> createState() => _MyReturnScreenState();
}

class _MyReturnScreenState extends ConsumerState<MyReturnDetailScreen> {
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;
  List<Warehouse> warehouseList = [];
  int selectedWarehouseID = 0;
  List<Map<int, dynamic>> requestedMapList = [];
  Map<int, dynamic> requestedMap = {};
  bool requestLoading = false;
  List<MyRequest> myReturnDataList = [];
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

  @override
  Widget build(BuildContext context) {
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
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
          requestLoading = true;
          myReturnDataList = [];
        });
      }
      if (next is MyReturnDataList) {
        setState(() {
          myReturnDataList = next.myReturnDataList;
          requestedMap.clear();
          requestedMapList.clear();
          for (var data in myReturnDataList) {
            for (var element in data.productLineList) {
              superPrint(element.isReturn);
              if (element.isReturn) {
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
          requestLoading = false;
          if (requestedMap.isNotEmpty) {
            if (requestedMap.keys.contains(selectedWarehouseID)) {
              selectedWarehouseID = selectedWarehouseID;
            } else {
              selectedWarehouseID = requestedMap.keys.first;
            }
            requestedMapList
                .add({selectedWarehouseID: requestedMap[selectedWarehouseID]});
          }
        });
      }
    });
    superPrint(requestedMapList);

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "My Return",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Positioned(
                right: 5.w,
                top: 6.5.h,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
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
                        // ref.read(bottomBarVisibilityProvider.notifier).state =
                        //     false;
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         const RequestHistoryScreen()));
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
                child: myreturnWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myreturnWidget() {
    return Container(
      width: 100.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchPendingRequestWidget(),
          warehouseWidget(),
          const SizedBox(height: 10),
          acceptedMyReturnWidget([]),
          Expanded(
            child: requestedMap[selectedWarehouseID] != null ||
                    selectedWarehouseID == -1
                ? myreturnDetailWidget(requestedMapList)
                : Center(
                    child: textWidget("No Data !"),
                  ),
          ),
        ],
      ),
    );
  }

  Widget myreturnDetailWidget(
    List<Map<int, dynamic>> requestedMapList,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container();
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
