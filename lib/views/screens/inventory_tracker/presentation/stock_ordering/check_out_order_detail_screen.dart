import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/barcode_scanner/barcode_scanner_screen.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../order_receiving/domain/order_receiving.dart';
import '../../repository/provider/stock_order_provider.dart';
import '../../repository/state/stock_order/stock_ordering_state.dart';
import '../widgets/inventory_app_bar_widget copy.dart';
import 'stack_order_line_detail_widget.dart';

class CheckOutOrderDetailScreen extends ConsumerStatefulWidget {
  //final List<StockOrder> stockOrderList;
  final Products productDetail;
  const CheckOutOrderDetailScreen({super.key, required this.productDetail});

  @override
  ConsumerState<CheckOutOrderDetailScreen> createState() =>
      _CheckOutOrderDetailScreenState();
}

class _CheckOutOrderDetailScreenState
    extends ConsumerState<CheckOutOrderDetailScreen> {
  double totalPrice = 0.0;
  bool isSubmit = false;
  List<OrderReceiving> orderFormDataList = [];
  List<int> purchaseID = [];
  //List<Map<String, dynamic>> orderLineList = [];
  // Map<String, List<Map<String, dynamic>>> checkOutDataMap = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      // ref.read(stockOrderStateNotifierProvider.notifier).showAllOrderFormData();
      ref.read(orderFormReasonStateNotifier.notifier).getOrderFormReason();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(stockOrderStateNotifierProvider.notifier).getAllOrderForm();
    });
    purchaseID.clear();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is OrderFormDataList) {
        setState(() {
          isSubmit = false;
          orderFormDataList = next.orderFormDataList;
          for (var checkOutMap in orderFormDataList) {
            purchaseID.add(checkOutMap.id);
            for (var data in checkOutMap.productList) {
              double entryTotalPrice = data.price * data.quantity;
              totalPrice += entryTotalPrice;
            }
          }
          superPrint(purchaseID);
        });
      }
      if (next is StockOrderingLoading) {
        setState(() {
          isSubmit = true;
        });
      }
      if (next is StockOrderingSuccess) {
        setState(() {
          isSubmit = false;
        });
      }
      if (next is Error) {
        setState(() {
          isSubmit = false;
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PopScope(
          onPopInvoked: (_) =>
              ref.read(addOrderCartStateNotifier.notifier).clearAddOrderMap(),
          child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(children: [
                inventoryAppBarWidget(
                  "Order Form",
                  () {
                    ref
                        .read(addOrderCartStateNotifier.notifier)
                        .clearAddOrderMap();
                    Navigator.of(context).pop();
                  },
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BarCodeScannerScreen()));
                  },
                  CupertinoIcons.qrcode_viewfinder,
                ),
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
                            superPrint("$baseUrl"
                                "report/pdf/purchase.report_purchaseorder/2577");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => PurchaseOrderPdfViewScreen(
                            //         imageUrl: "$baseUrl"
                            //             "report/pdf/purchase.report_purchaseorder/2577")));
                            ref
                                .read(stockOrderStateNotifierProvider.notifier)
                                .viewPurchasePdfFile(context, "2577");
                            // ref
                            //     .read(stockOrderStateNotifierProvider.notifier)
                            //     .submitPurchaseOrder(context, purchaseID);
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
            superPrint(orderFormDataList[index].orderProduct);
            // var entry = checkOutDataMap.entries.elementAt(index);
            String vendorName = orderFormDataList[index].orderProduct[1];
            //int vendorID = orderFormDataList[index].orderProduct[0];
            int vendorID = orderFormDataList[index].id;
            //  List<Map<String, dynamic>> products = entry.value;
            return stackOrderLineWidget(
                vendorID, vendorName, orderFormDataList[index].productList);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 0);
          },
          itemCount: orderFormDataList.length),
    );
  }
}
