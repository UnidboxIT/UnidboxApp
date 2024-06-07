import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../my_request/domain/my_request.dart';

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
  List<ProductLineId> acceptProductList = [];

  int selectedWarehouseID = -1;
  Map<int, dynamic> acceptedWarehouseMap = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      otherRequestList = widget.otherRequestList;
    });
    loadWarehouseData();
  }

  loadWarehouseData() {
    for (var data in otherRequestList) {
      for (var element in data.productLineList) {
        if (element.status.contains("packed")) {
          setState(() {
            acceptProductList.add(element);
            if (acceptedWarehouseMap.containsKey(element.warehouseList[0])) {
              // If the warehouseId exists, append the product line to the existing list
              acceptedWarehouseMap[element.warehouseList[0]]!.addAll({
                "warehouse_name": element.warehouseList[1],
                "code": data.name,
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": acceptProductList
              });
            } else {
              acceptedWarehouseMap[element.warehouseList[0]] = {
                "warehouse_name": element.warehouseList[1],
                "code": data.name,
                "name": data.userId[1],
                "date": data.createDate,
                "product_line": acceptProductList
              };
            }
            selectedWarehouseID = acceptedWarehouseMap.keys.first;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
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
          Map<String, dynamic> productList = acceptedWarehouseMap[key]!;
          superPrint(productList);
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: productList['product_line'].length,
              itemBuilder: (context, index) {
                return eachAcceptedDataWiget(
                    productList['code'],
                    productList['name'],
                    productList['date'],
                    productList['product_line'][index]);
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: acceptedWarehouseMap.length);
  }

  Widget eachAcceptedDataWiget(
      String code, String name, String currentDate, ProductLineId productLine) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                  code,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  size: 20,
                ),
                textWidget(
                    DateFormat('dd MMM yyyy').format(
                      DateTime.parse(currentDate),
                    ),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    size: 17)
              ],
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: const Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: productLine.imageUrl != "false"
                            ? NetworkImage(productLine.imageUrl)
                            : const AssetImage('assets/images/app_icon.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  height: 12.h,
                  width: 22.w,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(productLine.productIdList[1],
                          size: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          maxLine: 2,
                          textOverflow: TextOverflow.fade,
                          textAlign: TextAlign.left),
                      textWidget(productLine.code,
                          size: 12,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500),
                      textWidget(
                        productLine.model,
                        fontWeight: FontWeight.w500,
                        size: 12,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          addMinusIconButtonWidget(
                            CupertinoIcons.minus_circle_fill,
                          ),
                          const SizedBox(width: 10),
                          textWidget(productLine.qty.toString(),
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              size: 13),
                          const SizedBox(width: 10),
                          addMinusIconButtonWidget(
                            CupertinoIcons.add_circled_solid,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      "Request from",
                      color: AppColor.orangeColor,
                      size: 12.5,
                    ),
                    textWidget(
                      productLine.requestWarehouse[1],
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      size: 14,
                    ),
                    textWidget(
                      name,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      size: 14,
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 35,
                  width: 30.w,
                  child: buttonWidget("Pack", () {}),
                ),
              ],
            ),
          ],
        ),
      ),
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
                    if (selectedWarehouseID == key) {
                      selectedWarehouseID = -1;
                    } else {
                      selectedWarehouseID = key;
                    }
                  });
                  if (acceptedWarehouseMap[selectedWarehouseID] != null) {
                    Map<String, dynamic> value =
                        acceptedWarehouseMap[selectedWarehouseID];
                    acceptedWarehouseMap.clear();
                    if (acceptedWarehouseMap.containsKey(selectedWarehouseID)) {
                      // If the warehouseId exists, append the product line to the existing list
                      acceptedWarehouseMap[selectedWarehouseID]!.addAll({
                        "warehouse_name": value['warehouse_name'],
                        "code": value['code'],
                        "name": value['name'],
                        "date": value['date'],
                        "product_line": value['product_line'],
                      });
                    } else {
                      acceptedWarehouseMap[selectedWarehouseID] = {
                        "warehouse_name": value['warehouse_name'],
                        "code": value['code'],
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
}
