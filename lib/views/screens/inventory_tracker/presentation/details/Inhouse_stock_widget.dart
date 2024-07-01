import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/inhouse_stock_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/inhouse_stock_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_request_state.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';

class InhouseStockWidget extends ConsumerStatefulWidget {
  final List<InhouseStock> inHouseStockList;
  final Products productDetail;
  final UserWarehouse userWarehouse;
  const InhouseStockWidget(
      {super.key,
      required this.inHouseStockList,
      required this.productDetail,
      required this.userWarehouse});

  @override
  ConsumerState<InhouseStockWidget> createState() => _InhouseStockWidgetState();
}

class _InhouseStockWidgetState extends ConsumerState<InhouseStockWidget> {
  // List<String> requestType = ["Box", "Piece"];
  int selectedBox = 0;
  // int totalQty = 1;
  TextEditingController txtTotalQty = TextEditingController();
  bool isUrgent = false;
  bool isSendRequestLoading = false;
  bool isOverQty = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtTotalQty.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    selectedBox = widget.productDetail.uomList.isNotEmpty
        ? widget.productDetail.uomList[0]
        : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: textWidget(
                  "Location",
                  fontWeight: FontWeight.bold,
                  color: AppColor.orangeColor,
                  size: 14,
                ),
              ),
              Expanded(
                flex: 3,
                child: textWidget(
                  "Quantity",
                  color: AppColor.orangeColor,
                  size: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              )
            ],
          ),
          const SizedBox(height: 10),
          widget.inHouseStockList.isNotEmpty &&
                  widget.inHouseStockList[0].warehouseList[0] !=
                      widget.userWarehouse.warehouseList[0]
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: textWidget(widget.userWarehouse.warehouseList[1],
                          color: Colors.black,
                          size: 14,
                          textAlign: TextAlign.left),
                    ),
                    Expanded(
                      flex: 3,
                      child: textWidget("0",
                          color: Colors.black,
                          size: 14,
                          textAlign: TextAlign.center),
                    ),
                    const Expanded(flex: 4, child: SizedBox())
                  ],
                )
              : const SizedBox(),
          widget.inHouseStockList.isNotEmpty &&
                  widget.inHouseStockList[0].warehouseList[0] !=
                      widget.userWarehouse.warehouseList[0]
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String location =
                    widget.inHouseStockList[index].warehouseList[1];
                double qty = widget.inHouseStockList[index].qty == 'null'
                    ? 0
                    : double.parse(
                        widget.inHouseStockList[index].qty.toString());
                int id = widget.inHouseStockList[index].warehouseList[0];
                if (widget.inHouseStockList[0].warehouseList[0] !=
                    widget.userWarehouse.warehouseList[0]) {
                  return eachInhouseStockNotContainWidget(
                      location, qty.toString(), id, context);
                }
                return eachInhouseStockWidget(
                    location, qty.toString(), id, index, context);
              },
              separatorBuilder: (context, index) {
                return const SizedBox.shrink();
              },
              itemCount: widget.inHouseStockList.length),
          Container(
            height: 20,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  Widget eachInhouseStockWidget(
      String location, String qty, int id, int index, BuildContext context) {
    superPrint(qty);
    superPrint(location);
    superPrint("Contain");
    if (double.parse(qty) < 0) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: textWidget(location,
                  color: Colors.black, size: 14, textAlign: TextAlign.left),
            ),
            Expanded(
              flex: 3,
              child: textWidget(qty.toString(),
                  color: Colors.black, size: 14, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 4,
              child: index == 0
                  ? const SizedBox()
                  : SizedBox(
                      height: 40,
                      child: buttonWidget("Request", () {
                        showBottomSheet(location, id, qty);
                      })),
            )
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget eachInhouseStockNotContainWidget(
      String location, String qty, int id, context) {
    if (double.parse(qty) < 0) {
      return const SizedBox.shrink();
    }
    superPrint("Not Contain");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: textWidget(location,
                  color: Colors.black, size: 14, textAlign: TextAlign.left),
            ),
            Expanded(
              flex: 3,
              child: textWidget(qty.toString(),
                  color: Colors.black, size: 14, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                  height: 40,
                  child: buttonWidget("Request", () {
                    showBottomSheet(location, id, qty);
                  })),
            )
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget requestStockWidget(BuildContext context, String location,
      int requestWarehouseID, String qty) {
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
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.bottomSheetBgColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                textWidget(
                  "Request Quantity",
                  color: AppColor.orangeColor,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {
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
                )
              ],
            ),
            textWidget("Request from $location Outlet",
                color: Colors.black, size: 14),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addMinusIconButtonWidget(
                  () {
                    if (txtTotalQty.text.isEmpty) {
                      txtTotalQty.text = "0";
                    }
                    superPrint(double.parse(qty).toInt());
                    superPrint(int.parse(txtTotalQty.text).toInt());
                    if (double.parse(txtTotalQty.text).toInt() > 1) {
                      if (double.parse(qty).toInt() != 0) {
                        if (double.parse(qty).toInt() + 1 <
                            int.parse(txtTotalQty.text).toInt()) {
                          setState(() {
                            isOverQty = true;
                          });
                          ref
                              .read(inhouseStockStateNotifierProvider.notifier)
                              .overQuantity(isOverQty);
                        } else {
                          setState(() {
                            isOverQty = false;
                          });
                          ref
                              .read(inhouseStockStateNotifierProvider.notifier)
                              .overQuantity(isOverQty);
                        }
                      } else {
                        setState(() {
                          isOverQty = true;
                        });
                        ref
                            .read(inhouseStockStateNotifierProvider.notifier)
                            .overQuantity(isOverQty);
                      }
                    }
                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .decrementTotalQty(int.parse(txtTotalQty.text));
                  },
                  CupertinoIcons.minus_circle_fill,
                ),
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
                        if (value == "0") {
                          setState(() {
                            txtTotalQty.text = "1";
                          });
                        } else {
                          setState(() {
                            if (double.parse(qty).toInt() <
                                int.parse(value).toInt()) {
                              isOverQty = true;
                              ref
                                  .read(inhouseStockStateNotifierProvider
                                      .notifier)
                                  .overQuantity(isOverQty);
                            } else {
                              isOverQty = false;
                              ref
                                  .read(inhouseStockStateNotifierProvider
                                      .notifier)
                                  .overQuantity(isOverQty);
                            }
                          });
                        }

                        superPrint(isOverQty);
                      }
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                // textWidget(
                //   totalQty.toString(),
                //   size: 18,
                //   color: Colors.black,
                //   fontWeight: FontWeight.bold,
                // ),
                addMinusIconButtonWidget(
                  () {
                    if (txtTotalQty.text.isEmpty) {
                      txtTotalQty.text = "0";
                    }
                    if (double.parse(qty).toInt() <=
                        int.parse(txtTotalQty.text).toInt()) {
                      setState(() {
                        isOverQty = true;
                      });
                      ref
                          .read(inhouseStockStateNotifierProvider.notifier)
                          .overQuantity(isOverQty);
                    } else {
                      setState(() {
                        isOverQty = false;
                      });
                      ref
                          .read(inhouseStockStateNotifierProvider.notifier)
                          .overQuantity(isOverQty);
                    }

                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .incrementTotalQty(int.parse(txtTotalQty.text));
                  },
                  CupertinoIcons.add_circled_solid,
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                            .selectedRequestBox(
                                widget.productDetail.uomList[0]);
                      },
                      child: boxPieceWidget(widget.productDetail.uomList[1],
                          widget.productDetail.uomList[0]),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  ref
                                      .read(inhouseStockStateNotifierProvider
                                          .notifier)
                                      .selectedRequestBox(widget.productDetail
                                          .multiUomList[index][0]);
                                },
                                child: boxPieceWidget(
                                    widget.productDetail.multiUomList[index][1],
                                    widget.productDetail.multiUomList[index]
                                        [0]));
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemCount: widget.productDetail.multiUomList.length),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                urgentWidget(),
                Visibility(
                    visible: isOverQty,
                    child: textWidget(
                      "Your request have exceed the \namount available at the outlet",
                      size: 13,
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 50.w,
              child: buttonWidget("Send Request", () {
                if (!isOverQty) {
                  ref
                      .read(stockRequesstStateNotifierProvider.notifier)
                      .requestInHouseStock(
                        widget.userWarehouse.warehouseList[0],
                        requestWarehouseID,
                        admin.companyId,
                        widget.productDetail.id,
                        widget.productDetail.name,
                        int.parse(txtTotalQty.text),
                        widget.productDetail.price,
                        selectedBox,
                        isUrgent,
                        context,
                      )
                      .then((_) {
                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .getInHouseStock(widget.productDetail.id);
                  });
                }
              }, isBool: isSendRequestLoading),
            )
          ],
        ),
      );
    });
  }

  Widget addMinusIconButtonWidget(VoidCallback onPressed, IconData iconData) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 20.w,
        height: 50,
        color: Colors.transparent,
        child: Icon(
          iconData,
          color: AppColor.primary,
          size: 45,
        ),
      ),
    );
  }

  Widget boxPieceWidget(String name, int index) {
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

  Widget urgentWidget() {
    return GestureDetector(
      onTap: () {
        ref.read(inhouseStockStateNotifierProvider.notifier).selectedUrgent();
      },
      child: Container(
        width: 30.w,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              isUrgent
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_outlined,
            ),
            const SizedBox(width: 10),
            textWidget("Urgent")
          ],
        ),
      ),
    );
  }

  Future<void> showBottomSheet(location, int requestWarehouseID, String qty) {
    txtTotalQty.text = "1";
    if (double.parse(qty).toInt() < 1) {
      setState(() {
        isOverQty = true;
      });
    } else {
      setState(() {
        isOverQty = false;
      });
    }

    isUrgent = false;
    ref
        .read(inhouseStockStateNotifierProvider.notifier)
        .selectedRequestBox(widget.productDetail.uomList[0] ?? 0);
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
            final state = ref.watch(inhouseStockStateNotifierProvider);
            if (state is SelectedBoxType) {
              selectedBox = state.uomIndex;
            }
            if (state is IncrementQty) {
              txtTotalQty.text = state.qty.toString();
            }
            if (state is DecrementQty) {
              txtTotalQty.text = state.qty.toString();
            }
            if (state is Urgent) {
              isUrgent = state.selectedUrgent;
            }
            if (state is OverQty) {
              isOverQty = state.isOver;
            }

            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
                child: requestStockWidget(
                    context, location, requestWarehouseID, qty),
              ),
            );
          }),
        );
      },
    );
  }
}
