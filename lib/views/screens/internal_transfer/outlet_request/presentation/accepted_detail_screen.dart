import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../repository/provider/other_request_provider.dart';
import '../repository/state/other_request_state.dart';
import 'packed_list_screen.dart';
import 'widgets/each_other_request_product_widget.dart';

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
  Map<String, List<ProductLineId>> acceptProductMap = {};

  int selectedWarehouseID = -1;
  Map<int, dynamic> acceptedWarehouseMap = {};
  List<ProductLineId> packedProductList = [];
  int acceptProductID = -1;
  bool acceptLoading = false;
  List<Map<int, dynamic>> requestedMapList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      otherRequestList = widget.otherRequestList;
    });
    loadWarehouseData();
  }

  loadWarehouseData() {
    packedProductList.clear();
    acceptProductMap.clear();
    acceptedWarehouseMap.clear();
    requestedMapList.clear();
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status == 'packed') {
          setState(() {
            packedProductList.add(element);
          });
        }
        if (element.status.contains("accepted")) {
          setState(() {
            int warehouseId = element.warehouseList[0];
            String warehouseName = element.warehouseList[1];
            String productLineKey = data.name;
            if (!acceptedWarehouseMap.containsKey(warehouseId)) {
              acceptedWarehouseMap[warehouseId] = {
                "warehouse_name": warehouseName,
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": {}
              };
            }
            // Ensure each product line is unique per warehouse
            if (!acceptedWarehouseMap[warehouseId]['product_line']
                .containsKey(productLineKey)) {
              acceptedWarehouseMap[warehouseId]['product_line']
                  [productLineKey] = [];
            }
            acceptedWarehouseMap[warehouseId]['product_line'][productLineKey]
                .add(element);
          });
        }
      }
    }
    if (acceptedWarehouseMap.isNotEmpty) {
      selectedWarehouseID = acceptedWarehouseMap.keys.first;
      requestedMapList.add(
          {selectedWarehouseID: acceptedWarehouseMap[selectedWarehouseID]});
      // requestedMapList.add(acceptedWarehouseMap);
    }
    superPrint(selectedWarehouseID);
    superPrint(requestedMapList);
    superPrint(acceptedWarehouseMap);
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
          acceptLoading = false;
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
                child: acceptedWarehouseMap[selectedWarehouseID] == null
                    ? Center(child: textWidget("No Data !"))
                    : acceptedProductLineWidget(requestedMapList),
              )
            : Expanded(
                child: Center(
                  child: textWidget("No Data !"),
                ),
              ),
        const SizedBox(height: 20),
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
            int key = acceptedWarehouseMap.keys.elementAt(index);
            return Visibility(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWarehouseID = key;
                    if (acceptedWarehouseMap[selectedWarehouseID] != null) {
                      Map<String, dynamic> value =
                          acceptedWarehouseMap[selectedWarehouseID] ?? {};
                      requestedMapList.clear();
                      if (acceptedWarehouseMap
                          .containsKey(selectedWarehouseID)) {
                        acceptedWarehouseMap[selectedWarehouseID] = {
                          "warehouse_name": value['warehouse_name'],
                          "name": value['name'],
                          "date": value['date'],
                          "product_line": value['product_line']
                        };
                      }

                      requestedMapList.add({
                        selectedWarehouseID:
                            acceptedWarehouseMap[selectedWarehouseID]
                      });
                    } else {
                      setState(() {
                        acceptedWarehouseMap.remove(selectedWarehouseID);
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
                  child: textWidget(acceptedWarehouseMap[key]['warehouse_name'],
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
          itemCount: acceptedWarehouseMap.keys.length),
    );
  }

  Widget packedRequestWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PackedListScreen(
              otherRequestList: otherRequestList,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 20, right: 20, top: packedProductList.isEmpty ? 0 : 10),
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                  const SizedBox(width: 7),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15,
              right: -5,
              child: Visibility(
                visible: packedProductList.isNotEmpty,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.primary.withOpacity(0.6),
                  child: textWidget(
                    "${packedProductList.length}",
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
