import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/stock_order_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_ordering_state.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/product.dart';

class StockOrderingWidget extends ConsumerStatefulWidget {
  final List<StockOrder> stockOrderList;
  final Products productDetail;
  const StockOrderingWidget(
      {super.key, required this.stockOrderList, required this.productDetail});

  @override
  ConsumerState<StockOrderingWidget> createState() =>
      _StockOrderingWidgetState();
}

class _StockOrderingWidgetState extends ConsumerState<StockOrderingWidget> {
  int qty = 0;
  Map<int, int> totalQty = {};
  List<Map<String, dynamic>> orderLineList = [];
  Map<String, Map<String, dynamic>> checkOutDataMap = {};
  @override
  Widget build(BuildContext context) {
    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is IncrementStockOrderQty) {
        setState(() {
          totalQty = next.qty;
        });
      }
      if (next is DecrementStockOrderQty) {
        setState(() {
          totalQty = next.qty;
        });
      }

      if (next is OrderLines) {
        setState(() {
          orderLineList = next.orderLine;
        });
      }

      if (next is CheckOutMap) {
        setState(() {
          checkOutDataMap = next.checkoutMap;
        });
      }
      if (next is ClearTotalQty) {
        setState(() {
          totalQty = next.totalQty;
        });
      }
    });

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
                  "Vendor",
                  fontWeight: FontWeight.bold,
                  color: AppColor.orangeColor,
                  size: 14,
                ),
              ),
              Expanded(
                flex: 3,
                child: textWidget(
                  "Cost",
                  color: AppColor.orangeColor,
                  size: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 5,
                child: SizedBox(),
              )
            ],
          ),
          const SizedBox(height: 10),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String vendor = widget.stockOrderList[index].name[1];
                String price = widget.stockOrderList[index].price.toString();
                int stockOrderID = widget.stockOrderList[index].id;
                int companyId = widget.stockOrderList[index].company[0];
                int partnerId = widget.stockOrderList[index].name[0];
                return eachStockOrderingWidget(
                    vendor, price, stockOrderID, companyId, partnerId);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: widget.stockOrderList.length)
        ],
      ),
    );
  }

  Widget eachStockOrderingWidget(
      String vendor, String price, int vendorId, int companyId, int parterId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: textWidget(vendor,
              color: Colors.black, size: 14, textAlign: TextAlign.left),
        ),
        Expanded(
          flex: 3,
          child: textWidget(price,
              color: Colors.black, size: 14, textAlign: TextAlign.center),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addMinusIconButtonWidget(
                      () {
                        ref
                            .read(stockOrderStateNotifierProvider.notifier)
                            .decrementTotalQty(
                              vendorId,
                              vendor,
                              totalQty,
                              orderLineList,
                              checkOutDataMap,
                              widget.productDetail.id,
                              widget.productDetail.name,
                              widget.productDetail.uomList[0],
                              widget.productDetail.price,
                              widget.productDetail.imageUrl,
                              widget.productDetail.defaultCode,
                            );
                      },
                      CupertinoIcons.minus_circle_fill,
                    ),
                    const SizedBox(width: 10),
                    textWidget(
                      totalQty[vendorId].toString(),
                      size: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    addMinusIconButtonWidget(
                      () {
                        ref
                            .read(stockOrderStateNotifierProvider.notifier)
                            .incrementTotalQty(
                              vendorId,
                              vendor,
                              totalQty,
                              orderLineList,
                              checkOutDataMap,
                              widget.productDetail.id,
                              widget.productDetail.name,
                              widget.productDetail.uomList[0],
                              widget.productDetail.price,
                              widget.productDetail.imageUrl,
                              widget.productDetail.defaultCode,
                            );
                      },
                      CupertinoIcons.add_circled_solid,
                    ),
                  ],
                )
              : buttonWidget("Add To Cart", () {
                  ref
                      .read(stockOrderStateNotifierProvider.notifier)
                      .incrementTotalQty(
                        vendorId,
                        vendor,
                        totalQty,
                        orderLineList,
                        checkOutDataMap,
                        widget.productDetail.id,
                        widget.productDetail.name,
                        widget.productDetail.uomList[0],
                        widget.productDetail.price,
                        widget.productDetail.imageUrl,
                        widget.productDetail.defaultCode,
                      );
                }),
        )
      ],
    );
  }

  Widget addMinusIconButtonWidget(VoidCallback onPressed, IconData iconData) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 45,
        height: 50,
        color: Colors.transparent,
        child: Icon(
          iconData,
          color: AppColor.primary,
          size: 30,
        ),
      ),
    );
  }
}
