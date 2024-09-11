import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/return_request_reason.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_order/good_return_state.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';
import '../../../internal_transfer/my_request/presentation/widgets/each_product_line_widget.dart';
import '../../repository/provider/stock_order_provider.dart';
import '../../repository/state/stock_order/order_form_reason_state.dart';

Widget stackOrderLineWidget(
    String vendorName, List<Map<String, dynamic>> orderLineList) {
  Map<String, List<Map<int, bool>>> storeGoodReturnMap = {};

  return Consumer(
    builder: (context, ref, child) {
      final state = ref.watch(goodReturnStateNotifier);
      if (state is IsGoodReturnMap) {
        storeGoodReturnMap = state.isGoodReturnMap;
        superPrint(storeGoodReturnMap);
      }
      if (state is ClearSelectedGoodReturn) {
        storeGoodReturnMap.clear();
      }
      return Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, eachIndex) {
                        int productID = orderLineList[eachIndex]['product_id'];
                        String productImage = orderLineList[eachIndex]['image'];
                        String productName = orderLineList[eachIndex]['name'];
                        String productSku = orderLineList[eachIndex]['sku'];
                        double productPrice =
                            orderLineList[eachIndex]['price_unit'];
                        String qty =
                            orderLineList[eachIndex]['product_qty'].toString();
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height:
                                  storeGoodReturnMap.containsKey(vendorName) &&
                                          storeGoodReturnMap[vendorName]!.any(
                                              (productMap) =>
                                                  productMap
                                                      .containsKey(productID) &&
                                                  productMap[productID] == true)
                                      ? 36.5.h
                                      : 22.h,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: AppColor.pinkColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Map<String, List<Map<int, bool>>>
                                          goodReturnMap =
                                          Map.of(storeGoodReturnMap);
                                      if (goodReturnMap
                                          .containsKey(vendorName)) {
                                        List<Map<int, bool>> productMapList =
                                            List.of(goodReturnMap[vendorName]!);
                                        bool productExists = productMapList.any(
                                            (productMap) => productMap
                                                .containsKey(productID));
                                        if (productExists) {
                                          productMapList.removeWhere(
                                              (productMap) => productMap
                                                  .containsKey(productID));

                                          if (productMapList.isEmpty) {
                                            goodReturnMap.remove(vendorName);
                                          } else {
                                            goodReturnMap[vendorName] =
                                                productMapList;
                                          }
                                        } else {
                                          productMapList.add({productID: true});
                                          goodReturnMap[vendorName] =
                                              productMapList;
                                        }
                                      } else {
                                        goodReturnMap[vendorName] = [
                                          {productID: true}
                                        ];
                                      }
                                      ref
                                          .read(
                                              goodReturnStateNotifier.notifier)
                                          .addGoodReturnValue(goodReturnMap);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            storeGoodReturnMap.containsKey(
                                                        vendorName) &&
                                                    storeGoodReturnMap[
                                                            vendorName]!
                                                        .any((productMap) =>
                                                            productMap
                                                                .containsKey(
                                                                    productID) &&
                                                            productMap[
                                                                    productID] ==
                                                                true)
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank_outlined,
                                            color: storeGoodReturnMap
                                                        .containsKey(
                                                            vendorName) &&
                                                    storeGoodReturnMap[
                                                            vendorName]!
                                                        .any((productMap) =>
                                                            productMap
                                                                .containsKey(
                                                                    productID) &&
                                                            productMap[
                                                                    productID] ==
                                                                true)
                                                ? AppColor.orangeColor
                                                : Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          textWidget(
                                            "Goods Return",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: storeGoodReturnMap
                                              .containsKey(vendorName) &&
                                          storeGoodReturnMap[vendorName]!.any(
                                              (productMap) =>
                                                  productMap
                                                      .containsKey(productID) &&
                                                  productMap[productID] ==
                                                      true),
                                      child: eachGoodReturnWidget(
                                          productName, context)),
                                  Visibility(
                                      visible: storeGoodReturnMap
                                              .containsKey(vendorName) &&
                                          storeGoodReturnMap[vendorName]!.any(
                                              (productMap) =>
                                                  productMap
                                                      .containsKey(productID) &&
                                                  productMap[productID] ==
                                                      true),
                                      child: const SizedBox(height: 10)),
                                  Visibility(
                                      visible: storeGoodReturnMap
                                              .containsKey(vendorName) &&
                                          storeGoodReturnMap[vendorName]!.any(
                                              (productMap) =>
                                                  productMap
                                                      .containsKey(productID) &&
                                                  productMap[productID] ==
                                                      true),
                                      child: dropdownOrderFormReturnWidget(
                                          productID.toString()))
                                ],
                              ),
                            ),
                            eachOrderLineWidget(
                              productImage,
                              productName,
                              productPrice,
                              productSku,
                              qty,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 3);
                      },
                      itemCount: orderLineList.length,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
              child: Container(
                width: 100.w,
                height: 60,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColor.pinkColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: textWidget(
                  vendorName,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget eachGoodReturnWidget(String productName, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(
        "Products",
        fontWeight: FontWeight.w700,
        color: Colors.white,
        size: 14,
      ),
      const SizedBox(height: 6),
      Container(
        height: 45,
        //width: 79.w,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: textWidget(
            productName,
            color: Colors.grey.shade500,
            size: 13,
            maxLine: 1,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ],
  );
}

Widget eachOrderLineWidget(String productImage, String productName,
    double productPrice, String productSku, String qty) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      color: AppColor.bottomSheetBgColor,
    ),
    padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.dropshadowColor,
                blurRadius: 5,
                spreadRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: productImage != "false"
                    ? NetworkImage(productImage)
                    : const AssetImage('assets/images/app_icon.jpeg'),
                fit: BoxFit.cover),
          ),
          height: 11.h,
          width: 20.w,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(productName,
                  size: 15,
                  fontWeight: FontWeight.bold,
                  maxLine: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
              const SizedBox(height: 3),
              textWidget(productSku, size: 13, color: Colors.grey),
              const SizedBox(height: 8),
              Row(
                children: [
                  textWidget(
                    "\$ $productPrice",
                    fontWeight: FontWeight.bold,
                    size: 15,
                  ),
                  const Spacer(),
                  addMinusOrderFormIconButtonWidget(
                    CupertinoIcons.minus_circle_fill,
                  ),
                  const SizedBox(width: 10),
                  textWidget(qty),
                  const SizedBox(width: 10),
                  addMinusOrderFormIconButtonWidget(
                    CupertinoIcons.add_circled_solid,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget addMinusOrderFormIconButtonWidget(IconData iconData) {
  return Icon(
    iconData,
    color: AppColor.orangeColor,
    size: 23,
  );
}

Widget dropdownOrderFormReturnWidget(String productID) {
  Map<String, int> orderReasonQty = {};
  Map<String, dynamic> orderFormReasonMap = {};
  List<ReturnRequestReason> orderFormReasonList = [];

  return Consumer(builder: (context, ref, child) {
    final state = ref.watch(orderFormReasonStateNotifier);
    if (state is IncrementOrderFormReason) {
      orderReasonQty = state.qty;
    }
    if (state is DecrementOrderFormReason) {
      orderReasonQty = state.qty;
    }
    if (state is OrderFormReasonList) {
      orderFormReasonList = state.orderFormReasonList;
    }
    if (state is SelectedOrderFormReturnReason) {
      orderFormReasonMap = state.orderFormReasonMap;
      superPrint(orderFormReasonMap);
    }
    superPrint(orderFormReasonMap[productID]);
    return Row(
      children: [
        Container(
          width: 42.w,
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
                isExpanded: true,
                autofocus: true,
                isDense: true,
                dropdownStyleData: DropdownStyleData(
                  width: 80.w,
                  offset: const Offset(-10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
                hint: Text(
                  'Select Reason',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColor.fontColor.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
                items: orderFormReasonList
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.reason,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ))
                    .toList(),
                value: orderFormReasonMap[productID],
                onChanged: (values) {
                  superPrint(values);
                  ref
                      .read(orderFormReasonStateNotifier.notifier)
                      .addOrderFormReason(
                          productID, values!, orderFormReasonMap);
                }),
          ),
        ),
        const SizedBox(width: 7),
        Row(
          children: [
            addMinusIconButtonWidget(() {
              ref
                  .read(orderFormReasonStateNotifier.notifier)
                  .decrementOrderFormQty(orderReasonQty, productID);
            }, CupertinoIcons.minus_circle_fill, Colors.white),
            Container(
              width: 15.w,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: textWidget(
                '${orderReasonQty[productID] ?? 1} ',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                size: 14,
              ),
            ),
            addMinusIconButtonWidget(() {
              ref
                  .read(orderFormReasonStateNotifier.notifier)
                  .incrementOrderFormQty(orderReasonQty, productID);
            }, CupertinoIcons.add_circled_solid, Colors.white),
          ],
        )
      ],
    );
  });
}
