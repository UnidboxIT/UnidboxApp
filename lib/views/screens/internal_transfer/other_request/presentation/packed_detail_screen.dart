import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slider_button/slider_button.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import 'widgets/each_other_request_product_widget.dart';

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
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status.contains("packed")) {
          packedProductList.add(element);
          superPrint(data.name);
          setState(() {
            if (!packedProductMap.containsKey(data.name)) {
              packedProductMap[data.name] = [];
            }
            packedProductMap[data.name]!.add(element);
            if (packedWarehouseMap.containsKey(element.warehouseList[0])) {
              // If the warehouseId exists, append the product line to the existing list
              packedWarehouseMap[element.warehouseList[0]]!.addAll({
                "warehouse_name": element.warehouseList[1],
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": packedProductMap
              });
            } else {
              packedWarehouseMap[element.warehouseList[0]] = {
                "warehouse_name": element.warehouseList[1],
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": packedProductMap
              };
            }
            selectedWarehouseID = packedWarehouseMap.keys.first;
          });
        }
      }
    }
    superPrint(packedWarehouseMap);
  }

  @override
  Widget build(BuildContext context) {
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
          child: packedWarehouseMap[selectedWarehouseID] == null
              ? Center(child: textWidget("No Data !"))
              : acceptedProductLineWidget(packedWarehouseMap),
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
          child: SliderButton(
            action: () async {
              ///Do something here OnSlide
              return true;
            },
            label: const Text(
              "Slide to cancel Event",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            //buttonColor: AppColor.orangeColor,
            icon: Center(child: Lottie.asset('assets/lottie/delivery.json')),
          ),
        )
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
                        ref);
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
            int key = packedWarehouseMap.keys.elementAt(index);
            return Visibility(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWarehouseID = key;
                  });
                  if (packedWarehouseMap[selectedWarehouseID] != null) {
                    Map<String, dynamic> value =
                        packedWarehouseMap[selectedWarehouseID];
                    packedWarehouseMap.clear();
                    if (packedWarehouseMap.containsKey(selectedWarehouseID)) {
                      packedWarehouseMap[selectedWarehouseID]!.addAll({
                        "warehouse_name": value['warehouse_name'],
                        "name": value['name'],
                        "date": value['date'],
                        "product_line": value['product_line'],
                      });
                    } else {
                      packedWarehouseMap[selectedWarehouseID] = {
                        "warehouse_name": value['warehouse_name'],
                        "name": value['name'],
                        "date": value['date'],
                        "product_line": value['product_line'],
                      };
                    }
                  } else {
                    setState(() {
                      packedWarehouseMap.remove(selectedWarehouseID);
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
                      packedWarehouseMap.values.first['warehouse_name'],
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
    );
  }
}
