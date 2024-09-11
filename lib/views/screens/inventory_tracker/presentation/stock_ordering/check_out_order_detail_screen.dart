import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/barcode_scanner/barcode_scanner_screen.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/stock_order.dart';
import '../../repository/provider/stock_order_provider.dart';
import '../../repository/state/check_out_order_state.dart';
import '../../repository/state/stock_order/stock_ordering_state.dart';
import '../widgets/inventory_app_bar_widget copy.dart';
import 'stack_order_line_detail_widget.dart';

class CheckOutOrderDetailScreen extends ConsumerStatefulWidget {
  final List<StockOrder> stockOrderList;
  final Products productDetail;
  const CheckOutOrderDetailScreen(
      {super.key, required this.stockOrderList, required this.productDetail});

  @override
  ConsumerState<CheckOutOrderDetailScreen> createState() =>
      _CheckOutOrderDetailScreenState();
}

class _CheckOutOrderDetailScreenState
    extends ConsumerState<CheckOutOrderDetailScreen> {
  double totalPrice = 0.0;
  bool isSubmit = false;
  //List<Map<String, dynamic>> orderLineList = [];
  Map<String, List<Map<String, dynamic>>> checkOutDataMap = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(stockOrderStateNotifierProvider.notifier).showAllOrderFormData();
      ref.read(orderFormReasonStateNotifier.notifier).getOrderFormReason();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkoutOrderStateNotifierProvider, (pre, next) {
      if (next is CheckOutLoading) {
        setState(() {
          isSubmit = true;
        });
      }
      if (next is Successful) {
        setState(() {
          isSubmit = false;
        });
      }
    });

    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is BackupCheckOut) {
        setState(() {
          checkOutDataMap = next.checkoutMap;
        });
      }
    });
    superPrint(checkOutDataMap);
    for (var checkOutMap in checkOutDataMap.entries) {
      double entryTotalPrice = checkOutMap.value.fold(
        0.0,
        (sum, product) =>
            sum + (product['product_qty'] * product['price_unit']),
      );
      totalPrice += entryTotalPrice;
    }
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(children: [
              inventoryAppBarWidget("Order Form", () {
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BarCodeScannerScreen()));
              }, CupertinoIcons.qrcode_viewfinder),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      textWidget("Subtotal : ",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          size: 16),
                      const SizedBox(width: 5),
                      textWidget(
                          "\$ ${CommonMethods.twoDecimalPrice(totalPrice)}",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          size: 16),
                      const Spacer(),
                      SizedBox(
                        height: 45,
                        width: 30.w,
                        child: buttonWidget("Submit", () {
                          //clear form data local storage
                          ref
                              .read(stockOrderStateNotifierProvider.notifier)
                              .clearAllOrderForm();
                          if (widget.stockOrderList.isNotEmpty) {
                            ref
                                .read(stockOrderStateNotifierProvider.notifier)
                                .incrementTotalQty(
                                  widget.stockOrderList[0].id,
                                  widget.stockOrderList[0].name[1],
                                  {widget.stockOrderList.first.id: 0},
                                  {
                                    widget.stockOrderList.first.name[1]: [
                                      {
                                        'product_id': widget.productDetail.id,
                                        'name': widget.productDetail.fullName,
                                        'product_qty': 1,
                                        'product_uom':
                                            widget.productDetail.uomList[0],
                                        'price_unit':
                                            widget.productDetail.price,
                                        "image": widget.productDetail.imageUrl,
                                        "sku": widget.productDetail.defaultCode,
                                      }
                                    ]
                                  },
                                  widget.productDetail.id,
                                  widget.productDetail.fullName,
                                  widget.productDetail.uomList[0],
                                  widget.productDetail.price,
                                  widget.productDetail.imageUrl,
                                  widget.productDetail.defaultCode,
                                );
                          }
                          Navigator.of(context).pop();
                          superPrint(checkOutDataMap);
                          // ref
                          //     .read(checkoutOrderStateNotifierProvider.notifier)
                          //     .checkOutOrder(admin.companyId, admin.partnerId,
                          //         widget.orderLineList, context, ref);
                        }, isBool: isSubmit),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: orderLineDetailWidget(),
              ),
            ])),
      ),
    );
  }

  Widget orderLineDetailWidget() {
    return Container(
      width: 100.w,
      height: 71.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            var entry = checkOutDataMap.entries.elementAt(index);
            String companyName = entry.key;
            List<Map<String, dynamic>> products = entry.value;
            return stackOrderLineWidget(companyName, products);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 0);
          },
          itemCount: checkOutDataMap.length),
    );
  }
}
