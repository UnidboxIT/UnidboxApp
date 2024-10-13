import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/stock_order_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_order/add_order_cart_state.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/product.dart';
import '../../repository/state/stock_order/stock_ordering_state.dart';

int stockOrderID = 0;

class StockOrderingWidget extends ConsumerStatefulWidget {
  final Products productDetail;
  const StockOrderingWidget({super.key, required this.productDetail});

  @override
  ConsumerState<StockOrderingWidget> createState() =>
      _StockOrderingWidgetState();
}

class _StockOrderingWidgetState extends ConsumerState<StockOrderingWidget> {
  int qty = 0;
  Map<int, int> totalQty = {};
  List<Map<String, dynamic>> orderLineList = [];
  Map<int, List<Map<String, dynamic>>> checkOutMap = {};
  List<StockOrder> stockOrderList = [];

  @override
  void initState() {
    super.initState();
    checkOutMap.clear();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(stockOrderStateNotifierProvider.notifier)
          .getStockOrder(widget.productDetail.id, ref, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addOrderCartStateNotifier, (pre, next) {
      if (next is IncrementOrderCartQty) {
        setState(() {
          totalQty = next.qty;
        });
      }
      if (next is DecrementOrderCartQty) {
        setState(() {
          totalQty = next.qty;
        });
      }

      if (next is CheckOutMap) {
        setState(() {
          checkOutMap = next.checkoutMap;
        });
      }
      // if (next is ClearTotalQty) {
      //   setState(() {
      //     totalQty = next.totalQty;
      //   });
      // }
    });

    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is StockOrderingLoading) {
        setState(() {
          stockOrderList = [];
        });
      }
      if (next is StockOrderingList) {
        setState(() {
          stockOrderList = next.stockOrdering;
          if (stockOrderList.isNotEmpty) {
            setState(() {
              Future.delayed(const Duration(milliseconds: 10), () {
                ref
                    .read(addOrderCartStateNotifier.notifier)
                    .incrementAddOrderCart(
                        stockOrderList[0].name[0],
                        stockOrderList[0].name[1],
                        totalQty,
                        {
                          stockOrderList.first.name[0]: [
                            {
                              'product_id': widget.productDetail.id,
                              'name': widget.productDetail.name,
                              'product_qty': 1,
                              'product_uom': widget.productDetail.uomList[0],
                              'price_unit': widget.productDetail.price,
                            }
                          ]
                        },
                        widget.productDetail,
                        false);
              });
            });
          }
        });
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String vendor = stockOrderList[index].name[1];
                String price = stockOrderList[index].price.toString();
                stockOrderID = stockOrderList[index].name[0];
                int companyId = stockOrderList[index].company[0];
                int partnerId = stockOrderList[index].name[0];

                return eachStockOrderingWidget(
                  vendor,
                  price,
                  stockOrderID,
                  companyId,
                  partnerId,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: stockOrderList.length),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget eachStockOrderingWidget(
      String vendor, String price, int vendorId, int companyId, int parterId) {
    return GestureDetector(
      onTap: totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
          ? null
          : () {
              ref
                  .read(addOrderCartStateNotifier.notifier)
                  .clearAddOrderMap()
                  .then((_) {
                ref
                    .read(addOrderCartStateNotifier.notifier)
                    .incrementAddOrderCart(vendorId, vendor, totalQty,
                        checkOutMap, widget.productDetail, true);
              });
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
              ? AppColor.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: textWidget(vendor,
                  color:
                      totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
                          ? Colors.white
                          : const Color.fromARGB(255, 14, 12, 12),
                  size: 14,
                  textAlign: TextAlign.left),
            ),
            Expanded(
              flex: 3,
              child: textWidget("\$$price",
                  color:
                      totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
                          ? Colors.white
                          : Colors.black,
                  size: 14,
                  textAlign: TextAlign.center),
            ),
            const SizedBox(width: 10),
            Expanded(
                flex: 5,
                child:
                    totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addMinusIconButtonWidget(() {
                                ref
                                    .read(addOrderCartStateNotifier.notifier)
                                    .decrementAddOrderCart(
                                        vendorId,
                                        vendor,
                                        totalQty,
                                        checkOutMap,
                                        widget.productDetail);
                              }, CupertinoIcons.minus_circle_fill, vendorId),
                              const SizedBox(width: 10),
                              textWidget(
                                totalQty[vendorId].toString(),
                                size: 18,
                                color: totalQty.containsKey(vendorId) &&
                                        totalQty[vendorId]! >= 1
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(width: 10),
                              addMinusIconButtonWidget(() {
                                ref
                                    .read(addOrderCartStateNotifier.notifier)
                                    .incrementAddOrderCart(
                                        vendorId,
                                        vendor,
                                        totalQty,
                                        checkOutMap,
                                        widget.productDetail,
                                        false); // ref
                              }, CupertinoIcons.add_circled_solid, vendorId),
                            ],
                          )
                        : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }

  Widget addMinusIconButtonWidget(
      VoidCallback onPressed, IconData iconData, int vendorId) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 45,
        height: 50,
        color: Colors.transparent,
        child: Icon(
          iconData,
          color: totalQty.containsKey(vendorId) && totalQty[vendorId]! >= 1
              ? Colors.white
              : Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
