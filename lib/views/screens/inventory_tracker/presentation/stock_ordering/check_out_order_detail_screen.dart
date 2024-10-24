import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/warehouse.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/barcode_scanner/barcode_scanner_screen.dart';
import 'package:unidbox_app/views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import 'package:unidbox_app/views/user_warehouse/provider/user_warehouse_provider.dart';
import 'package:unidbox_app/views/user_warehouse/state/user_warehouse_state.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../order_receiving/domain/order_receiving.dart';
import '../../../order_receiving/presentation/order_receiving_screen.dart';
import '../../repository/provider/stock_order_provider.dart';
import '../../repository/state/stock_order/good_return_state.dart';
import '../../repository/state/stock_order/order_form_reason_state.dart';
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
  List<OrderReceiving> returnOrderLine = [];
  UserWarehouse userWarehouse = UserWarehouse();
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
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
    purchaseID.clear();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userWarehouseStateNotifierProvider, (pre, next) {
      if (next is UserWarehouseData) {
        setState(() {
          userWarehouse = next.warehouse;
        });
      }
    });
    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is OrderFormDataList) {
        setState(() {
          orderFormDataList = next.orderFormDataList;
          for (var checkOutMap in orderFormDataList) {
            purchaseID.add(checkOutMap.id);
            for (var data in checkOutMap.productList) {
              double entryTotalPrice = data.price * data.quantity;
              totalPrice += entryTotalPrice;
            }
          }
          isSubmit = false;
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
                            returnOrderLine.clear();
                            String returReason = "";
                            int returnPurchaseID = 0;

                            for (var entry in storeGoodReturnMap.entries) {
                              int orderId = entry.key; // Order ID from map
                              List<Map<int, bool>> productList = entry.value;
                              returnPurchaseID = orderId;
                              superPrint(orderId);
                              // Find matching order in the list
                              var matchingOrder =
                                  orderFormDataList.firstWhere((order) {
                                return order.id == orderId;
                              }, orElse: () => OrderReceiving());
                              for (var productEntry in productList) {
                                int productIdFromMap = productEntry.keys.first;
                                var productListMatch = matchingOrder.productList
                                    .firstWhere((product) {
                                  return product.id == productIdFromMap;
                                },
                                        orElse: () => OrderReceivingProduct(
                                            id: -1,
                                            products: [],
                                            defaultCode: "",
                                            quantity: -1,
                                            price: -1,
                                            imageUrl: ""));

                                returnOrderLine.add(matchingOrder);
                              }
                            }
                            List<Map<String, dynamic>> orderLineList = [];
                            for (var data in returnOrderLine) {
                              for (var product in data.productList) {
                                orderLineList.add({
                                  "product_id": product.id,
                                  "name": product.products[1],
                                  "product_qty": product.quantity,
                                  "product_uom": product.productUom
                                });
                              }
                            }
                            superPrint(orderLineList);
                            List<String> allReturnReason = [];
                            orderFormReasonMap.forEach((key, reasonsData) {
                              allReturnReason.add(reasonsData.name);
                            });
                            returReason = allReturnReason.join(", ");
                            superPrint(returReason);
                            // ref
                            //     .read(stockOrderStateNotifierProvider.notifier)
                            //     .submitPurchaseOrder(context, purchaseID, ref);
                            if (storeGoodReturnMap != {}) {
                              // ref
                              //     .read(
                              //         stockOrderStateNotifierProvider.notifier)
                              //     .returnReasonOrderForm(
                              //         returnPurchaseID,
                              //         returReason,
                              //         orderLineList,
                              //         context,
                              //         ref,
                              //         userWarehouse.warehouseList[0]);
                            }
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
            superPrint(orderFormDataList);
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
