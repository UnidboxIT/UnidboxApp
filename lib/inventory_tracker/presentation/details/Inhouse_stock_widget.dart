import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/inhouse_stock_provider.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/inhouse_stock_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';

class InhouseStockWidget extends ConsumerStatefulWidget {
  final List<InhouseStock> inHouseStockList;
  final Products productDetail;
  const InhouseStockWidget(
      {super.key, required this.inHouseStockList, required this.productDetail});

  @override
  ConsumerState<InhouseStockWidget> createState() => _InhouseStockWidgetState();
}

class _InhouseStockWidgetState extends ConsumerState<InhouseStockWidget> {
  // List<String> requestType = ["Box", "Piece"];
  int selectedBox = 0;
  int totalQty = 1;
  bool isUrgent = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    superPrint(widget.productDetail.uomList[0]);
    selectedBox = widget.productDetail.uomList[0];
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
          widget.inHouseStockList[0].warehouseList[0] != admin.warehouseMap[0]
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: textWidget(admin.warehouseMap[1],
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
          widget.inHouseStockList[0].warehouseList[0] != admin.warehouseMap[0]
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String location =
                    widget.inHouseStockList[index].warehouseList[1];
                String qty = widget.inHouseStockList[index].qty;
                int id = widget.inHouseStockList[index].warehouseList[0];
                if (widget.inHouseStockList[0].warehouseList[0] !=
                    admin.warehouseMap[0]) {
                  return eachInhouseStockNotContainWidget(
                      location, qty.toString(), id, context);
                }
                return eachInhouseStockWidget(
                    location, qty.toString(), id, index, context);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: widget.inHouseStockList.length)
        ],
      ),
    );
  }

  Widget eachInhouseStockWidget(
      String location, String qty, int id, int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: textWidget(location,
              color: Colors.black, size: 14, textAlign: TextAlign.left),
        ),
        Expanded(
          flex: 3,
          child: textWidget(qty,
              color: Colors.black, size: 14, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 4,
          child: index == 0
              ? const SizedBox()
              : SizedBox(height: 40, child: buttonWidget("Request", () {})),
        )
      ],
    );
  }

  Widget eachInhouseStockNotContainWidget(
      String location, String qty, int id, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: textWidget(location,
              color: Colors.black, size: 14, textAlign: TextAlign.left),
        ),
        Expanded(
          flex: 3,
          child: textWidget(qty,
              color: Colors.black, size: 14, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(
              height: 40,
              child: buttonWidget("Request", () {
                showBottomSheet(location, id);
              })),
        )
      ],
    );
  }

  Widget requestStockWidget(
      BuildContext context, String location, int requestWarehouseID) {
    return Container(
      width: 100.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColor.bottomSheetBgColor,
        borderRadius: BorderRadius.circular(30),
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
                  ref
                      .read(inhouseStockStateNotifierProvider.notifier)
                      .decrementTotalQty(totalQty);
                },
                CupertinoIcons.minus_circle_fill,
              ),
              const SizedBox(width: 10),
              textWidget(
                totalQty.toString(),
                size: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 10),
              addMinusIconButtonWidget(
                () {
                  ref
                      .read(inhouseStockStateNotifierProvider.notifier)
                      .incrementTotalQty(totalQty);
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
                          .selectedRequestBox(widget.productDetail.uomList[0]);
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
                                    .selectedRequestBox(widget
                                        .productDetail.multiUomList[index][0]);
                              },
                              child: boxPieceWidget(
                                  widget.productDetail.multiUomList[index][1],
                                  widget.productDetail.multiUomList[index][0]));
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
            ],
          ),
          const SizedBox(height: 20),
          buttonWidget("Send Request", () {
            ref
                .read(stockRequesstStateNotifierProvider.notifier)
                .requestInHouseStock(
                  admin.warehouseMap[0],
                  requestWarehouseID,
                  admin.companyId,
                  widget.productDetail.id,
                  widget.productDetail.name,
                  totalQty,
                  widget.productDetail.price,
                  selectedBox,
                  context,
                );
          })
        ],
      ),
    );
  }

  Widget addMinusIconButtonWidget(VoidCallback onPressed, IconData iconData) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30.w,
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

  Future<void> showBottomSheet(location, int requestWarehouseID) {
    totalQty = 1;
    isUrgent = false;
    ref
        .read(inhouseStockStateNotifierProvider.notifier)
        .selectedRequestBox(widget.productDetail.uomList[0] ?? 0);
    return showModalBottomSheet(
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
        return Consumer(builder: (context, ref, child) {
          final state = ref.watch(inhouseStockStateNotifierProvider);
          if (state is SelectedBoxType) {
            selectedBox = state.uomIndex;
          }
          if (state is IncrementQty) {
            totalQty = state.qty;
          }
          if (state is DecrementQty) {
            totalQty = state.qty;
          }
          if (state is Urgent) {
            isUrgent = state.selectedUrgent;
          }

          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: requestStockWidget(context, location, requestWarehouseID),
            ),
          );
        });
      },
    );
  }
}