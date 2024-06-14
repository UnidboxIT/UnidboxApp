import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_action/slide_action.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../repository/state/other_request_state.dart';
import 'widgets/packed_other_request_widget.dart';

class PackedDetailScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;

  const PackedDetailScreen({
    super.key,
    required this.otherRequestList,
  });

  @override
  ConsumerState<PackedDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<PackedDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  Map<String, List<ProductLineId>> packedProductMap = {};
  int selectedWarehouseID = -1;
  Map<int, dynamic> packedWarehouseMap = {};
  List<ProductLineId> packedProductList = [];
  List<ProductLineId> acceptedProductList = [];
  bool isSwipeLoading = false;

  List<Map<int, dynamic>> requestedMapList = [];
  List<Map<int, dynamic>> finalDeveilerMapList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      otherRequestList = widget.otherRequestList;
    });
    loadWarehouseData();
  }

  loadWarehouseData() {
    packedWarehouseMap.clear();
    packedProductMap.clear();
    requestedMapList.clear();
    acceptedProductList.clear();
    finalDeveilerMapList.clear();
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status.contains("requested")) {
          acceptedProductList.add(element);
        }
        if (element.status.contains("packed")) {
          setState(() {
            packedProductList.add(element);
            int warehouseId = element.warehouseList[0];
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!packedWarehouseMap.containsKey(warehouseId)) {
              packedWarehouseMap[warehouseId] = {
                "id": data.id,
                "warehouse_name": warehouseName,
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": {}
              };
            }
            // Ensure each product line is unique per warehouse
            if (!packedWarehouseMap[warehouseId]['product_line']
                .containsKey(productLineKey)) {
              packedWarehouseMap[warehouseId]['product_line']
                  [productLineKey] = [];
            }
            packedWarehouseMap[warehouseId]['product_line'][productLineKey]
                .add(element);
          });
        }
      }
    }
    if (packedWarehouseMap.isNotEmpty) {
      selectedWarehouseID = packedWarehouseMap.keys.first;
      requestedMapList
          .add({selectedWarehouseID: packedWarehouseMap[selectedWarehouseID]});
      finalDeveilerMapList.add(packedWarehouseMap);
    }
    superPrint(selectedWarehouseID);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        setState(() {
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
    });

    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
        packedRequestWidget(),
        const SizedBox(height: 15),
        warehouseWidget(),
        requestedMapList.isNotEmpty
            ? Expanded(
                child: packedWarehouseMap[selectedWarehouseID] == null
                    ? Center(child: textWidget("No Data !"))
                    : acceptedProductLineWidget(requestedMapList),
              )
            : Expanded(
                child: Center(
                  child: textWidget("No Data !"),
                ),
              ),
        Container(
          height: 10.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
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
                      left:
                          state.isPerformingAction || isSwipeLoading ? 0 : 20.w,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                    setState(() {
                      List<int> idList = [];
                      for (var warehouseProduct in finalDeveilerMapList) {
                        warehouseProduct.forEach((key, value) {
                          idList.add(value['id']);
                        });
                      }
                      superPrint(idList);
                      Future.delayed(const Duration(milliseconds: 100));
                      if (idList.isNotEmpty) {
                        if (acceptedProductList.isEmpty) {
                          ref
                              .read(otherRequestStateNotifierProvider.notifier)
                              .deliveryOtherRequest(idList, context);
                        } else {
                          isSwipeLoading = false;
                          CommonMethods.customizedAlertDialog(
                              "Please packed all your requested product",
                              context);
                        }
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
                    return eachPackedDataWiget(
                      productLineKey,
                      warehouseData['name'],
                      warehouseData['date'],
                      productList[subIndex],
                      ref,
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
            return Visibility(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWarehouseID = key;
                    if (packedWarehouseMap[selectedWarehouseID] != null) {
                      Map<String, dynamic> value =
                          packedWarehouseMap[selectedWarehouseID] ?? {};
                      requestedMapList.clear();
                      if (packedWarehouseMap.containsKey(selectedWarehouseID)) {
                        packedWarehouseMap[selectedWarehouseID] = {
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
                    } else {
                      setState(() {
                        packedWarehouseMap.remove(selectedWarehouseID);
                      });
                    }
                  });
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
                  "Packed".toUpperCase(),
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
}
