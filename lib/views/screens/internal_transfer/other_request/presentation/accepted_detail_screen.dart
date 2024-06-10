import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
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
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status == 'packed') {
          setState(() {
            packedProductList.add(element);
          });
        }
        if (element.status.contains("accepted")) {
          superPrint(data.name);
          setState(() {
            if (!acceptProductMap.containsKey(data.name)) {
              acceptProductMap[data.name] = [];
            }
            acceptProductMap[data.name]!.add(element);
            if (acceptedWarehouseMap.containsKey(element.warehouseList[0])) {
              // If the warehouseId exists, append the product line to the existing list
              acceptedWarehouseMap[element.warehouseList[0]]!.addAll({
                "warehouse_name": element.warehouseList[1],
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": acceptProductMap
              });
            } else {
              acceptedWarehouseMap[element.warehouseList[0]] = {
                "warehouse_name": element.warehouseList[1],
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": acceptProductMap
              };
            }
            selectedWarehouseID = acceptedWarehouseMap.keys.first;
          });
        }
      }
    }
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
        const SizedBox(height: 15),
        Expanded(
          child: acceptedWarehouseMap[selectedWarehouseID] == null
              ? Center(child: textWidget("No Data !"))
              : acceptedProductLineWidget(acceptedWarehouseMap),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget acceptedProductLineWidget(
    Map<int, dynamic> acceptedWarehouseMap,
  ) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, mainIndex) {
          int key = acceptedWarehouseMap.keys.elementAt(mainIndex);
          superPrint(key);
          Map<String, dynamic> warehouseData = acceptedWarehouseMap[key]!;
          Map<String, dynamic> productLineMap = warehouseData['product_line'];
          superPrint(productLineMap);
          superPrint(productLineMap.keys);
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: productLineMap.keys.length,
              itemBuilder: (context, index) {
                String productLineKey = productLineMap.keys.elementAt(index);
                List<dynamic> productList = productLineMap[productLineKey];
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, subIndex) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: productList.length,
                  itemBuilder: (context, subIndex) {
                    return eachAcceptedDataWiget(
                        productLineKey,
                        warehouseData['name'],
                        warehouseData['date'],
                        productList[subIndex],
                        ref,
                        isAcceptLoading: acceptLoading,
                        acceptProductID: acceptProductID);
                  },
                );
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: acceptedWarehouseMap.length);
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
                  });
                  if (acceptedWarehouseMap[selectedWarehouseID] != null) {
                    Map<String, dynamic> value =
                        acceptedWarehouseMap[selectedWarehouseID];
                    acceptedWarehouseMap.clear();
                    if (acceptedWarehouseMap.containsKey(selectedWarehouseID)) {
                      acceptedWarehouseMap[selectedWarehouseID]!.addAll({
                        "warehouse_name": value['warehouse_name'],
                        "name": value['name'],
                        "date": value['date'],
                        "product_line": value['product_line'],
                      });
                    } else {
                      acceptedWarehouseMap[selectedWarehouseID] = {
                        "warehouse_name": value['warehouse_name'],
                        "name": value['name'],
                        "date": value['date'],
                        "product_line": value['product_line'],
                      };
                    }
                  } else {
                    setState(() {
                      acceptedWarehouseMap.remove(selectedWarehouseID);
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
                  child: textWidget(
                      acceptedWarehouseMap.values.first['warehouse_name'],
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
                  const SizedBox(width: 7),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
