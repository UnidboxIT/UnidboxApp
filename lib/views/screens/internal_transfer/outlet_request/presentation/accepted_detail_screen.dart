import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_action/slide_action.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../widgets/internal_transfer/no_product_widget.dart';
import '../../my_return/repository/provider/my_return_provider.dart';
import '../../my_return/repository/state/my_return_state.dart';
import '../repository/state/other_request_state.dart';
import 'my_return_issued/accepted_my_return_issued_screen.dart';
import 'widgets/packed_other_request_widget.dart';

class AcceptedDetailScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;

  const AcceptedDetailScreen({
    super.key,
    required this.otherRequestList,
  });

  @override
  ConsumerState<AcceptedDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<AcceptedDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  // Map<String, List<ProductLineId>> packedProductMap = {};
  int selectedWarehouseID = -1;
  int acceptedSelectedWarehouseID = -1;
  Map<int, dynamic> packedWarehouseMap = {};
  Map<int, dynamic> backUpPackedWarehouseMap = {};
  //Map<int, dynamic> acceptedWarehouseMap = {};
  List<ProductLineId> packedProductList = [];
  List<ProductLineId> acceptedProductList = [];
  bool isSwipeLoading = false;
  List<int> idList = [];
  List<int> isUrgentIdList = [];
  List<Map<int, dynamic>> requestedMapList = [];
  List<Map<int, dynamic>> finalDeveilerMapList = [];
  // List<Map<int, dynamic>> acceptedMapList = [];
  bool isPackedProductEqual = false;
  List<MyRequest> myReturnList = [];
  Map<int, dynamic> returnRequestedMap = {};
  List<Map<int, dynamic>> requestedReturnMapList = [];
  Map<dynamic, dynamic> hideSlideButton = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      otherRequestList = widget.otherRequestList;
    });
    loadWarehouseData();
    Future.delayed(const Duration(milliseconds: 10), () async {
      await ref.read(myReturnStateNotifierProvider.notifier).getAllMyReturn();
    });
  }

  Future<void> loadWarehouseData() async {
    finalDeveilerMapList.clear();
    requestedMapList.clear();
    packedWarehouseMap.forEach((key, value) {
      value['product_line'] = {};
    });

    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status == 'accepted') {
          setState(() {
            packedProductList.add(element);
          });
        }
        // if (element.status.contains("requested")) {
        //   acceptedProductList.add(element);
        //   setState(() {
        //     acceptedProductList.add(element);
        //     int warehouseId = element.warehouseList[0];
        //     String warehouseName = element.warehouseList[1];
        //     String productLineKey = data.name;
        //     if (!acceptedWarehouseMap.containsKey(warehouseId)) {
        //       acceptedWarehouseMap[warehouseId] = {
        //         "warehouse_name": warehouseName,
        //         "name": data.userId[1],
        //         "date": data.createDate,
        //         "product_line": {}
        //       };
        //     }

        //     if (!acceptedWarehouseMap[warehouseId]['product_line']
        //         .containsKey(productLineKey)) {
        //       acceptedWarehouseMap[warehouseId]['product_line']
        //           [productLineKey] = {
        //         "id": data.id,
        //         "is_urgent_picking": data.isUrgentPicking,
        //         "products": [],
        //       };
        //     }
        //     acceptedWarehouseMap[warehouseId]['product_line'][productLineKey]
        //             ['products']
        //         .add(element);
        //   });
        // }
        if (element.status == "accepted") {
          setState(() {
            int warehouseId = element.warehouseList[0];
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!packedWarehouseMap.containsKey(warehouseId)) {
              packedWarehouseMap[warehouseId] = {
                "warehouse_name": warehouseName,
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": {}
              };
            }
            if (!packedWarehouseMap[warehouseId]['product_line']
                .containsKey(productLineKey)) {
              packedWarehouseMap[warehouseId]['product_line']
                  [productLineKey] = {
                "id": data.id,
                "is_urgent_picking": data.isUrgentPicking,
                "products": [],
              };
            }
            packedWarehouseMap[warehouseId]['product_line'][productLineKey]
                    ['products']
                .add(element);
          });
        }
      }
    }

    if (packedWarehouseMap.isNotEmpty) {
      if (packedWarehouseMap.keys.contains(selectedWarehouseID)) {
        selectedWarehouseID = selectedWarehouseID;
      } else {
        selectedWarehouseID = packedWarehouseMap.keys.first;
      }
      requestedMapList
          .add({selectedWarehouseID: packedWarehouseMap[selectedWarehouseID]});
      finalDeveilerMapList.add(packedWarehouseMap);

      for (var warehouseProduct in requestedMapList) {
        warehouseProduct.forEach((key, value) {
          Map<dynamic, dynamic> productLine = value['product_line'];
          productLine.forEach((key, value) {
            if (value['is_urgent_picking']) {
              isUrgentIdList.add(value['id']);
            } else {
              idList.add(value['id']);
            }
          });
        });
      }
      // if (acceptedWarehouseMap.isNotEmpty) {
      //   acceptedMapList.add(acceptedWarehouseMap);
      // }
      packedWarehouseMap.forEach((key, value) {
        print('Warehouse ID: $key');
        // Check if product_line exists
        if (value.containsKey('product_line')) {
          Map<dynamic, dynamic> productLine = value['product_line'];
          if (productLine.isNotEmpty) {
            productLine.forEach((lineKey, lineValue) {
              hideSlideButton[key] = lineValue;
            });
          } else {
            hideSlideButton[key] = productLine;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
          myReturnList = [];
        });
      }
      if (next is MyReturnDataList) {
        setState(() {
          myReturnList = next.myReturnDataList;
          returnRequestedMap.clear();
          requestedReturnMapList.clear();
          for (var data in myReturnList) {
            for (var element in data.productLineList) {
              if (element.status == "return_accepted") {
                int warehouseId = data.isNewReturn
                    ? element.warehouseList[0]
                    : element.requestWarehouse[0];
                String warehouseName = data.isNewReturn
                    ? element.warehouseList[1]
                    : element.requestWarehouse[1];
                String productLineKey = data.name;
                if (!returnRequestedMap.containsKey(warehouseId)) {
                  returnRequestedMap[warehouseId] = {
                    "id": data.id,
                    "warehouse_name": warehouseName,
                    "name": data.userId[1],
                    "date": data.createDate,
                    "product_line": {}
                  };
                }

                if (!returnRequestedMap[warehouseId]['product_line']
                    .containsKey(productLineKey)) {
                  returnRequestedMap[warehouseId]['product_line']
                      [productLineKey] = {
                    "is_return": data.isNewReturn,
                    "products": []
                  };
                }
                returnRequestedMap[warehouseId]['product_line'][productLineKey]
                        ['products']
                    .add(element);
              }
            }
          }

          if (returnRequestedMap.isNotEmpty) {
            if (returnRequestedMap.keys.contains(acceptedSelectedWarehouseID)) {
              acceptedSelectedWarehouseID = acceptedSelectedWarehouseID;
            } else {
              acceptedSelectedWarehouseID = returnRequestedMap.keys.first;
            }
            if (selectedWarehouseID == -1) {
              selectedWarehouseID = acceptedSelectedWarehouseID;
            }
            requestedReturnMapList.add({
              acceptedSelectedWarehouseID:
                  returnRequestedMap[acceptedSelectedWarehouseID]
            });
            returnRequestedMap.forEach((key, value) {
              bool warehouseExists = packedWarehouseMap.values.any((entry) =>
                  entry['warehouse_name'] == value['warehouse_name']);
              if (!warehouseExists) {
                Map<String, dynamic> valueCopy =
                    Map<String, dynamic>.from(value);
                valueCopy["product_line"] = {};
                packedWarehouseMap[key] = valueCopy;
              }
            });
          }
        });
      }
    });

    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
          idList.clear();
          isUrgentIdList.clear();
          packedProductList.clear();
          otherRequestList = [];
        });
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          loadWarehouseData();
        });
      }
      if (next is Error) {
        setState(() {
          isSwipeLoading = false;
        });
      }
    });

    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
        packedRequestWidget(),
        const SizedBox(height: 15),
        warehouseWidget(),
        Expanded(
          child: packedWarehouseMap.isEmpty ||
                  packedWarehouseMap[selectedWarehouseID] == null
              ? Center(child: textWidget("No Data !"))
              : ListView(
                  children: [
                    acceptedProductLineWidget(requestedMapList),
                    returnRequestedMap.isNotEmpty &&
                            returnRequestedMap[acceptedSelectedWarehouseID] !=
                                null &&
                            packedWarehouseMap[selectedWarehouseID]
                                    ['warehouse_name'] ==
                                returnRequestedMap[acceptedSelectedWarehouseID]
                                    ['warehouse_name']
                        ? returnProductItemWidget()
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
        hideSlideButton[selectedWarehouseID] == {} ||
                hideSlideButton[selectedWarehouseID] == null ||
                hideSlideButton[selectedWarehouseID].isEmpty
            ? const SizedBox.shrink()
            : Container(
                height: 14.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 3.5.h),
                child: SlideAction(
                  thumbWidth: 100,
                  rightToLeft: isSwipeLoading,
                  trackBuilder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: state.isPerformingAction || isSwipeLoading
                                ? 0
                                : 20.w,
                            right: state.isPerformingAction || isSwipeLoading
                                ? 20.w
                                : 0),
                        child: Text(
                          // Show loading if async operation is being performed
                          isSwipeLoading
                              ? "Issued"
                              : state.isPerformingAction
                                  ? "Loading..."
                                  : ">>  Slide to Issue",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                  },
                  thumbBuilder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        // Show loading indicator if async operation is being performed
                        child: state.isPerformingAction
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : const Icon(
                                CupertinoIcons.car,
                                color: Colors.white,
                              ),
                      ),
                    );
                  },
                  action: () async {
                    // Async operation
                    if (!isSwipeLoading) {
                      await Future.delayed(
                        const Duration(milliseconds: 10),
                        () {
                          setState(() {
                            isSwipeLoading = true;
                          });
                          superPrint(idList);
                          setState(() {
                            List<String> warehouseNames =
                                getWarehouseNames(requestedReturnMapList);
                            Future.delayed(const Duration(milliseconds: 100));
                            if (isUrgentIdList.isNotEmpty) {
                              ref
                                  .read(otherRequestStateNotifierProvider
                                      .notifier)
                                  .deliveryOtherRequest(
                                    isUrgentIdList,
                                    context,
                                    warehouseNames,
                                    packedWarehouseMap,
                                    selectedWarehouseID,
                                  )
                                  .then((_) {
                                ref
                                    .read(otherRequestStateNotifierProvider
                                        .notifier)
                                    .getAllOtherRequest();
                                isSwipeLoading = false;
                              });
                            } else if (idList.isNotEmpty) {
                              ref
                                  .read(otherRequestStateNotifierProvider
                                      .notifier)
                                  .deliveryOtherRequest(
                                    idList,
                                    context,
                                    warehouseNames,
                                    packedWarehouseMap,
                                    selectedWarehouseID,
                                  )
                                  .then((_) {
                                ref
                                    .read(otherRequestStateNotifierProvider
                                        .notifier)
                                    .getAllOtherRequest();
                                isSwipeLoading = false;
                              });
                            } else {
                              isSwipeLoading = false;
                              CommonMethods.customizedAlertDialog(
                                  "Please check picking first", context);
                            }
                          });
                        },
                      );
                    }
                  },
                ),
              )
      ],
    );
  }

  Widget acceptedProductLineWidget(
    List<Map<int, dynamic>> requestedMapList,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
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
            return productLineMap == {} || productLineMap.isEmpty
                ? noAcceptPackedProductWidget(
                    warehouseData['warehouse_name'] + " Outlet",
                    "All Product Issued")
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
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            productLineMap[productLineKey]['products'].length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 0);
                        },
                        itemBuilder: (context, subIndex) {
                          return eachPackedDataWiget(
                              productLineKey,
                              warehouseData['name'],
                              warehouseData['date'],
                              productLineMap[productLineKey]['products']
                                  [subIndex],
                              ref,
                              productLineMap[productLineKey]
                                      ['is_urgent_picking'] ??
                                  false,
                              context);
                        },
                      );
                    },
                  );
          }).toList(),
        );
      },
    );
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word; // Return empty string if input is empty
    }
    return word[0].toUpperCase() + word.substring(1);
  }

  Widget addMinusIconButtonWidget(IconData iconData) {
    return Icon(
      iconData,
      color: AppColor.pinkColor,
      size: 18,
    );
  }

  Widget warehouseWidget() {
    return Container(
      height: 5.5.h,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            int key = packedWarehouseMap.keys.elementAt(index);
            return GestureDetector(
              onTap: () {
                idList.clear();
                setState(() {
                  selectedWarehouseID = key;
                  acceptedSelectedWarehouseID = key;
                  requestedMapList.clear();
                  requestedReturnMapList.clear();

                  if (packedWarehouseMap.isNotEmpty) {
                    if (packedWarehouseMap[selectedWarehouseID] != null) {
                      Map<String, dynamic> value =
                          packedWarehouseMap[selectedWarehouseID] ?? {};

                      if (packedWarehouseMap.containsKey(selectedWarehouseID)) {
                        packedWarehouseMap[selectedWarehouseID] = {
                          //"id": value["id"],
                          "warehouse_name": value['warehouse_name'],
                          "name": value['name'],
                          "date": value['date'],
                          "product_line": value['product_line']
                        };
                      }
                      requestedMapList.add({
                        selectedWarehouseID:
                            packedWarehouseMap[selectedWarehouseID]
                      });
                    } else if (returnRequestedMap[
                            acceptedSelectedWarehouseID] !=
                        null) {
                      Map<String, dynamic> returnedValueMap =
                          returnRequestedMap[acceptedSelectedWarehouseID] ?? {};
                      if (returnRequestedMap
                          .containsKey(acceptedSelectedWarehouseID)) {
                        returnRequestedMap[acceptedSelectedWarehouseID] = {
                          "id": returnedValueMap["id"],
                          "warehouse_name": returnedValueMap['warehouse_name'],
                          "name": returnedValueMap['name'],
                          "date": returnedValueMap['date'],
                          "product_line": returnedValueMap['product_line']
                        };
                      }
                      requestedReturnMapList.add({
                        acceptedSelectedWarehouseID:
                            returnRequestedMap[acceptedSelectedWarehouseID]
                      });
                    } else {
                      setState(() {
                        packedWarehouseMap.remove(selectedWarehouseID);
                        returnRequestedMap.remove(acceptedSelectedWarehouseID);
                      });
                    }
                  }
                });
                for (var warehouseProduct in requestedMapList) {
                  warehouseProduct.forEach((key, value) {
                    Map<dynamic, dynamic> productLine = value['product_line'];
                    productLine.forEach((key, value) {
                      if (value['is_urgent_picking']) {
                        isUrgentIdList.add(value['id']);
                      } else {
                        idList.add(value['id']);
                      }
                    });
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: selectedWarehouseID == key
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
                child: textWidget(packedWarehouseMap[key]['warehouse_name'],
                    color: selectedWarehouseID == key
                        ? Colors.white
                        : Colors.black),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: packedWarehouseMap.keys.length),
    );
  }

  Widget packedRequestWidget() {
    return Padding(
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
                  "Issuing".toUpperCase(),
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                const Icon(CupertinoIcons.bus),
                const SizedBox(width: 7),
                textWidget(
                  "${packedProductList.length} Items",
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> getWarehouseNames(List<Map<int, dynamic>> data) {
    List<String> warehouseNames = [];
    for (var map in data) {
      map.forEach((key, value) {
        if (value.containsKey('warehouse_name')) {
          warehouseNames.add(value['warehouse_name']);
        }
      });
    }
    return warehouseNames;
  }

  Widget returnProductItemWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AcceptedMyReturnIssuedScreen(
                  warehouseID: selectedWarehouseID,
                  warehouseName: packedWarehouseMap[selectedWarehouseID]
                      ['warehouse_name'],
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 5.h),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.bottomSheetBgColor,
          ),
          child: Row(
            children: [
              textWidget(
                "Return".toUpperCase(),
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 15,
              ),
              const Spacer(),
              const Icon(CupertinoIcons.bus),
              const SizedBox(width: 7),
              textWidget(
                "${returnRequestedMap[acceptedSelectedWarehouseID]['product_line'].values.length} Items",
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
