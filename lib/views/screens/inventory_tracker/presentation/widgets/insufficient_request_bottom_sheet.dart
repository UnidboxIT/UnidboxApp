import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../internal_transfer/my_request/presentation/widgets/each_product_line_widget.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../../repository/state/inhouse_stock_state.dart';
import '../../repository/state/stock_request_state.dart';
import '../details/Inhouse_stock_widget.dart';
import 'each_product_list_request_widget.dart';

TextEditingController txtTotalQty = TextEditingController();
int requestWarehouseQty = 0;
Future<void> showInsuffiecientBottomSheet(String productId,
    BuildContext context, Products product, UserWarehouse userWarehouse) {
  int requestWarehouseID = -1;
  List<InhouseStock> inHouseStockList = [];
  List<InhouseStock> filterWareHouseList = [];
  selectedBox = product.uomList.isNotEmpty ? product.uomList[0] : 0;
  txtTotalQty.text = qtyByMap[productId]!.toString();
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.black.withOpacity(0.1),
    barrierColor: Colors.black.withOpacity(0.3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    elevation: 0,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // To ensure the sheet is above the keyboard
        ),
        child: Consumer(builder: (context, ref, child) {
          superPrint(userWarehouse.warehouseList[0]);
          final state = ref.watch(inhouseStockStateNotifierProvider);
          if (state is DefaultWarehouseIncrementQty &&
              state.productID == productId) {
            qtyByMap.addAll({productId: state.qty});
            txtTotalQty.text = qtyByMap[productId]!.toString();
          }
          if (state is DefaultWarehouseDecrementQty &&
              state.productID == productId) {
            qtyByMap.addAll({productId: state.qty});
            txtTotalQty.text = qtyByMap[productId]!.toString();
          }

          if (state is DefaultWarehouseTextFieldValue &&
              state.productID == productId) {
            qtyByMap.addAll({productId: state.qty});
            txtTotalQty.text = qtyByMap[productId]!.toString();
          }
          if (state is SelectedWarehouseID) {
            requestWarehouseID = state.warehouseID;
            requestWarehouseQty = state.qty;
          }
          if (state is InhouseStockList) {
            inHouseStockList = state.inhouseStock;
            filterWareHouseList = inHouseStockList
                .where((stock) =>
                    userWarehouse.warehouseList[0] != stock.warehouseList[0] &&
                    double.parse(stock.qty) >= 0)
                .toList();
            if (filterWareHouseList.isNotEmpty) {
              requestWarehouseID = filterWareHouseList.first.warehouseList[0];
              requestWarehouseQty =
                  double.parse(filterWareHouseList.first.qty).toInt();
            }
          }

          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: requestStockWidget(context, productId, product,
                  filterWareHouseList, userWarehouse, requestWarehouseID),
            ),
          );
        }),
      );
    },
  );
}

Widget requestStockWidget(
  BuildContext context,
  String productId,
  Products product,
  List<InhouseStock> inHouseStockList,
  UserWarehouse userWarehouse,
  int requestWarehouseID,
) {
  superPrint(inHouseStockList);
  superPrint(requestWarehouseID);
  superPrint(qtyByMap[productId]);
  return Consumer(builder: (context, ref, child) {
    final next = ref.watch(stockRequesstStateNotifierProvider);
    if (next is StockRequestLoading) {
      isSendRequestLoading = true;
    }
    if (next is StockRequestSuccess) {
      isSendRequestLoading = false;
    }

    return Container(
      width: 100.w,
      height: inHouseStockList.length > 3 ? 60.h : 55.h,
      decoration: BoxDecoration(
        color: AppColor.bottomSheetBgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus!.unfocus();
                Navigator.of(context).pop();
              },
              child: Container(
                width: 28.w,
                color: Colors.transparent,
                height: 40,
                alignment: Alignment.centerRight,
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: AppColor.primary,
                ),
              ),
            ),
          ),
          textWidget(
            "Request from other outlet?",
            color: AppColor.primary,
            size: 17,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: inHouseStockList.length > 3 ? 17.h : 12.h,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    textWidget(
                      inHouseStockList[index].warehouseList[1],
                      color: AppColor.orangeColor,
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        superPrint(inHouseStockList[index].warehouseList);
                        ref
                            .read(inhouseStockStateNotifierProvider.notifier)
                            .selectedWarehouseID(
                                inHouseStockList[index].warehouseList[0],
                                double.parse(inHouseStockList[index].qty)
                                    .toInt());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: inHouseStockList[index].warehouseList[0] ==
                                    requestWarehouseID
                                ? AppColor.orangeColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.dropshadowColor,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ]),
                        alignment: Alignment.center,
                        child: textWidget(inHouseStockList[index].qty,
                            textAlign: TextAlign.center,
                            color: inHouseStockList[index].warehouseList[0] ==
                                    requestWarehouseID
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ],
                );
              },
              itemCount: inHouseStockList.length,
            ),
          ),
          SizedBox(height: inHouseStockList.length > 3 ? 15 : 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addMinusIconButtonWidget(() {
                ref
                    .read(inhouseStockStateNotifierProvider.notifier)
                    .defaultWarehouseDecrementQty(
                        productId, int.parse(txtTotalQty.text));
              }, CupertinoIcons.minus_circle_fill, AppColor.primary),
              const SizedBox(width: 10),
              SizedBox(
                height: 45,
                width: 28.w,
                child: TextFormField(
                  controller: txtTotalQty,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: AppColor.primary,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      txtTotalQty.text = value;
                      ref
                          .read(inhouseStockStateNotifierProvider.notifier)
                          .defaultWarehouseTextFieldValue(
                              productId, int.parse(txtTotalQty.text));
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              addMinusIconButtonWidget(() {
                ref
                    .read(inhouseStockStateNotifierProvider.notifier)
                    .defaultWarehouseIncrementQty(
                        productId, int.parse(txtTotalQty.text));
              }, CupertinoIcons.add_circled_solid, AppColor.primary),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(inhouseStockStateNotifierProvider.notifier)
                          .selectedRequestBox(product.uomList[0]);
                    },
                    child:
                        boxPieceWidget(product.uomList[1], product.uomList[0]),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                ref
                                    .read(inhouseStockStateNotifierProvider
                                        .notifier)
                                    .selectedRequestBox(
                                        product.multiUomList[index][0]);
                              },
                              child: boxPieceWidget(
                                  product.multiUomList[index][1],
                                  product.multiUomList[index][0]));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: product.multiUomList.length),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              urgentWidget(ref, product.id.toString()),
              Visibility(
                visible: requestWarehouseQty < qtyByMap[productId]!,
                child: textWidget(
                  "Your request have exceed the \namount available at the outlet",
                  size: 13,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 50.w,
            child: buttonWidget(
              "Send Request",
              () {
                if (requestWarehouseID != -1 &&
                    requestWarehouseQty >= qtyByMap[productId]!) {
                  superPrint(qtyByMap[product.id.toString()]!);
                  ref
                      .read(stockRequesstStateNotifierProvider.notifier)
                      .requestInHouseStock(
                        userWarehouse.warehouseList[0],
                        requestWarehouseID,
                        admin.companyId,
                        product.id,
                        product.name,
                        qtyByMap[product.id.toString()]!,
                        product.price,
                        selectedBox,
                        isUrgentMap[product.id.toString()] ?? false,
                        context,
                      )
                      .then((_) {
                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .getInHouseStock(product.id);
                    qtyByMap[product.id.toString()] = 1;
                  });
                } else {
                  successfullyBottomSheet(
                      "Request Sent Fail!", "Please select your request outlet",
                      () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }, isFail: true, context);
                }
              },
              isBool: isSendRequestLoading,
            ),
          )
        ],
      ),
    );
  });
}

Widget boxPieceWidget(String name, int index) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      color: index == selectedBox ? AppColor.pinkColor : Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: textWidget(
      name,
      fontWeight: FontWeight.bold,
      color: index == selectedBox ? Colors.white : Colors.black,
      size: 15,
    ),
  );
}

Widget urgentWidget(WidgetRef ref, String productID) {
  return GestureDetector(
    onTap: () {
      if (isUrgentMap[productID] == true) {
        ref
            .read(inhouseStockStateNotifierProvider.notifier)
            .unselectedWarehouseUrgent(productID, false);
      } else {
        ref
            .read(inhouseStockStateNotifierProvider.notifier)
            .selectedWarehouseUrgent(productID, true);
      }
    },
    child: Container(
      width: 30.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(
            isUrgentMap[productID] == true
                ? Icons.check_box_rounded
                : Icons.check_box_outline_blank_outlined,
            size: 18,
          ),
          const SizedBox(width: 10),
          textWidget("Urgent", size: 12, fontWeight: FontWeight.bold)
        ],
      ),
    ),
  );
}
