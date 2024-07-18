import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../../utils/constant/app_constant.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/domain/inhouse_stock.dart';
import '../../../../inventory_tracker/presentation/details/Inhouse_stock_widget.dart';
import '../../../../inventory_tracker/repository/provider/inhouse_stock_provider.dart';
import '../../../../inventory_tracker/repository/provider/product_detail_provider.dart';
import '../../../../inventory_tracker/repository/state/inhouse_stock_state.dart';
import '../../../../inventory_tracker/repository/state/product_detail_state.dart';
import '../../../../inventory_tracker/repository/state/stock_request_state.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../domain/my_request.dart';
import '../widgets/each_pending_request_list_widget.dart';

Future<void> showInsufficientRejectedRequestBottomsheet(
    String productId,
    BuildContext context,
    ProductLineId productLineId,
    UserWarehouse userWarehouse,
    String requestWarehouse,
    int requestWarehouseId) {
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
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: RequestStockWidget(
                productId: productId,
                productLineId: productLineId,
                userWarehouse: userWarehouse,
                requestWarehouse: requestWarehouse,
                requestWhID: requestWarehouseId,
              )),
        ),
      );
    },
  );
}

class RequestStockWidget extends ConsumerStatefulWidget {
  final String productId;
  final ProductLineId productLineId;
  final UserWarehouse userWarehouse;
  final String requestWarehouse;
  final int requestWhID;
  const RequestStockWidget({
    super.key,
    required this.productId,
    required this.productLineId,
    required this.userWarehouse,
    required this.requestWarehouse,
    required this.requestWhID,
  });

  @override
  ConsumerState<RequestStockWidget> createState() => _RequestStockWidgetState();
}

class _RequestStockWidgetState extends ConsumerState<RequestStockWidget> {
  bool isRejectUrget = false;
  TextEditingController txtTotalQty = TextEditingController();
  int requestWarehouseQty = 0;
  int requestWarehouseID = -1;
  List<InhouseStock> inHouseStockList = [];
  List<InhouseStock> filterWareHouseList = [];
  Products productDetail = Products();
  int selectedUom = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(productDetailStateNotifierProvider.notifier)
          .productByID(widget.productId.toString());
    });
    selectedUom = widget.productLineId.productUomList.isNotEmpty
        ? widget.productLineId.productUomList[0]
        : 0;
    txtTotalQty.text =
        "${double.parse(widget.productLineId.qty.toString()).toInt() - double.parse(widget.productLineId.issueQty.toString()).toInt()}";
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(inhouseStockStateNotifierProvider);
    if (state is DefaultWarehouseIncrementQty &&
        state.productID == widget.productId) {
      txtTotalQty.text = state.qty.toString();
    }
    if (state is DefaultWarehouseDecrementQty &&
        state.productID == widget.productId) {
      txtTotalQty.text = state.qty.toString();
    }

    if (state is DefaultWarehouseTextFieldValue &&
        state.productID == widget.productId) {
      txtTotalQty.text = state.qty.toString();
    }
    if (state is SelectedWarehouseID) {
      requestWarehouseID = state.warehouseID;
      superPrint(requestWarehouseID);
      requestWarehouseQty = state.qty;
    }
    if (state is InhouseStockList) {
      inHouseStockList = state.inhouseStock;
      filterWareHouseList = inHouseStockList
          .where((stock) =>
              widget.userWarehouse.warehouseList[0] != stock.warehouseList[0] &&
              double.parse(stock.qty) > 0)
          .toList();
      if (filterWareHouseList.isNotEmpty) {
        requestWarehouseQty =
            double.parse(filterWareHouseList.first.qty).toInt();
      }
    }
    final productDetailState = ref.watch(productDetailStateNotifierProvider);
    if (productDetailState is ProductDetail) {
      productDetail = productDetailState.products;
    }
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
          SizedBox(
            width: 100.w,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    textWidget(
                        "${widget.requestWarehouse} have insufficient quantity\nor your request.",
                        color: AppColor.primary,
                        size: 17,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                    textWidget(
                      "Request from other outlet?",
                      color: AppColor.primary,
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Positioned(
                  top: -2.h,
                  right: -10.w,
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          true;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 30.w,
                      color: Colors.transparent,
                      height: 55,
                      child: Icon(
                        CupertinoIcons.clear_circled_solid,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        if (widget.requestWhID !=
                            inHouseStockList[index].warehouseList[0]) {
                          if (productDetail.defaultWarehouseList.isEmpty) {
                            ref
                                .read(
                                    inhouseStockStateNotifierProvider.notifier)
                                .selectedWarehouseID(
                                    inHouseStockList[index].warehouseList[0],
                                    double.parse(inHouseStockList[index].qty)
                                        .toInt());
                          } else if (productDetail
                                  .defaultWarehouseList.isNotEmpty &&
                              productDetail.defaultWarehouseList[0] !=
                                  widget.userWarehouse.warehouseList[0]) {
                            ref
                                .read(
                                    inhouseStockStateNotifierProvider.notifier)
                                .selectedWarehouseID(
                                    inHouseStockList[index].warehouseList[0],
                                    double.parse(inHouseStockList[index].qty)
                                        .toInt());
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: inHouseStockList[index].warehouseList[0] ==
                                    requestWarehouseID
                                ? AppColor.orangeColor
                                : widget.requestWhID ==
                                        inHouseStockList[index].warehouseList[0]
                                    ? Colors.grey.shade400
                                    : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.dropshadowColor,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ]),
                        alignment: Alignment.center,
                        child: widget.requestWhID ==
                                inHouseStockList[index].warehouseList[0]
                            ? textWidget(
                                "Qty - ${double.parse(inHouseStockList[index].qty).toInt()}",
                                textAlign: TextAlign.center,
                                size: 14,
                                color: Colors.white)
                            : textWidget(
                                double.parse(inHouseStockList[index].qty)
                                    .toInt()
                                    .toString(),
                                textAlign: TextAlign.center,
                                color:
                                    inHouseStockList[index].warehouseList[0] ==
                                            requestWarehouseID
                                        ? Colors.white
                                        : Colors.black,
                                size: 14),
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
                    .defaultWarehouseDecrementQty(widget.productId,
                        double.parse(txtTotalQty.text).toInt());
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
                          .defaultWarehouseTextFieldValue(widget.productId,
                              double.parse(txtTotalQty.text).toInt());
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              addMinusIconButtonWidget(() {
                ref
                    .read(inhouseStockStateNotifierProvider.notifier)
                    .defaultWarehouseIncrementQty(widget.productId,
                        double.parse(txtTotalQty.text).toInt());
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
                          .selectedRequestBox(
                              widget.productLineId.productUomList[0]);
                    },
                    child: boxPieceWidget(
                      widget.productLineId.productUomList[1],
                      widget.productLineId.productUomList[0],
                    ),
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
                                        productDetail.multiUomList[index][0]);
                              },
                              child: boxPieceWidget(
                                productDetail.multiUomList[index][1],
                                productDetail.multiUomList[index][0],
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: productDetail.multiUomList.length),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              urgentWidget(),
              Visibility(
                visible: requestWarehouseQty <
                    double.parse(txtTotalQty.text).toInt(),
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
                    requestWarehouseQty >=
                        double.parse(txtTotalQty.text).toInt()) {
                  isSendRequestLoading
                      ? () {}
                      : ref
                          .read(stockRequesstStateNotifierProvider.notifier)
                          .requestInHouseStock(
                            widget.userWarehouse.warehouseList[0],
                            requestWarehouseID,
                            admin.companyId,
                            widget.productLineId.productIdList[0],
                            widget.productLineId.productIdList[1],
                            double.parse(txtTotalQty.text).toInt(),
                            widget.productLineId.price,
                            selectedUom,
                            isRejectUrget,
                            context,
                            ref,
                          )
                          .then((_) {
                          ref
                              .read(inhouseStockStateNotifierProvider.notifier)
                              .getInHouseStock(
                                  widget.productLineId.productIdList[0],
                                  context);
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
  }

  Widget boxPieceWidget(String name, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: index == selectedUom ? AppColor.pinkColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: textWidget(
        name,
        fontWeight: FontWeight.bold,
        color: index == selectedUom ? Colors.white : Colors.black,
        size: 15,
      ),
    );
  }

  Widget urgentWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRejectUrget = !isRejectUrget;
        });
      },
      child: Container(
        width: 30.w,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              isRejectUrget
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
}
