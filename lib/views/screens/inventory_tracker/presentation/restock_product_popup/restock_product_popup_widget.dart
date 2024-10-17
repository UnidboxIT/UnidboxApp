import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/presentation/widgets/each_my_return_product_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/restock_order_state/restock_order_state.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/product.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../../repository/provider/restock_ordering_provider.dart';

TextEditingController txtQty = TextEditingController();
Future<void> restockProductPopUpWidget(
    BuildContext context, Products productDetail, UserWarehouse userWarehouse) {
  txtQty.clear();
  int selectedBox =
      productDetail.uomList.isNotEmpty ? productDetail.uomList[0] : 0;
  bool isRestock = false;
  // txtQty.text = productDetail.
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
          final state = ref.watch(restockOrderStateNotifierProvider);
          if (state is RestockOrderLoading) {
            isRestock = true;
          }
          if (state is RestockOrderSuccess) {
            isRestock = false;
          }
          if (state is RestockOrderError) {
            isRestock = false;
          }
          if (state is IncrementRestockOrderQty) {
            txtQty.text = state.qty.toString();
          }
          if (state is DecrementRestockOrderQty) {
            txtQty.text = state.qty.toString();
          }
          if (state is SetRestockTextFieldValue) {
            txtQty.text = state.qty.toString();
          }
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColor.bottomSheetBgColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textWidget(
                          "Reordering Rules",
                          color: AppColor.orangeColor,
                          fontWeight: FontWeight.w600,
                          size: 15,
                        ),
                        SizedBox(width: 21.w),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            CupertinoIcons.clear_circled_solid,
                            color: AppColor.primary,
                          ),
                        )
                      ],
                    ),
                    textWidget(
                      "Set min restock quantity when\nstock is insufficient",
                      textAlign: TextAlign.center,
                      size: 14,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget("Min in stock: 3", size: 14),
                        const SizedBox(width: 20),
                        textWidget("Current stock: 5", size: 14),
                      ],
                    ),
                    const SizedBox(height: 20),
                    textWidget("Restock Quantity",
                        fontWeight: FontWeight.w700,
                        size: 15.5,
                        color: AppColor.orangeColor),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget("Min"),
                        const SizedBox(width: 10),
                        addMinusIconButtonWidget(
                          () {
                            ref
                                .read(
                                    restockOrderStateNotifierProvider.notifier)
                                .restockDecrementQty(int.parse(txtQty.text));
                          },
                          CupertinoIcons.minus_circle_fill,
                          Colors.green.withOpacity(0.4),
                          size: 40,
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                          height: 45,
                          width: 28.w,
                          child: TextFormField(
                            controller: txtQty,
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
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                txtQty.text = value;
                                ref
                                    .read(restockOrderStateNotifierProvider
                                        .notifier)
                                    .setTextFieldWhValue(
                                        int.parse(txtQty.text));
                              }
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 15),
                        addMinusIconButtonWidget(
                          () {
                            ref
                                .read(
                                    restockOrderStateNotifierProvider.notifier)
                                .restockIncremetQty(int.parse(txtQty.text));
                          },
                          CupertinoIcons.add_circled_solid,
                          AppColor.primary,
                          size: 40,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(
                                    inhouseStockStateNotifierProvider.notifier)
                                .selectedRequestBox(productDetail.uomList[0]);
                          },
                          child: boxPieceWidget(productDetail.uomList[1],
                              productDetail.uomList[0], selectedBox),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (productDetail.multiUomList[index][0] ==
                                    false) {
                                  return const SizedBox.shrink();
                                }
                                return GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(
                                              inhouseStockStateNotifierProvider
                                                  .notifier)
                                          .selectedRequestBox(productDetail
                                              .multiUomList[index][0]);
                                    },
                                    child: boxPieceWidget(
                                        productDetail.multiUomList[index][1],
                                        productDetail.multiUomList[index][0],
                                        selectedBox));
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemCount: productDetail.multiUomList.length),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                        width: 30.w,
                        child: buttonWidget("Save", () {
                          ref
                              .read(restockOrderStateNotifierProvider.notifier)
                              .restockOrder(
                                  context,
                                  productDetail.id,
                                  productDetail.uomList[0],
                                  int.parse(txtQty.text),
                                  userWarehouse.warehouseList[0]);
                        }, isBool: isRestock)),
                    SizedBox(height: 6.h)
                  ],
                ),
              ),
            ),
          );
        }),
      );
    },
  );
}

Widget boxPieceWidget(String name, int index, int selectedBox) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    decoration: BoxDecoration(
      color: index == selectedBox ? AppColor.pinkColor : Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: textWidget(
      name,
      fontWeight: FontWeight.bold,
      color: index == selectedBox ? Colors.white : Colors.black,
      size: 15,
    ),
  );
}
