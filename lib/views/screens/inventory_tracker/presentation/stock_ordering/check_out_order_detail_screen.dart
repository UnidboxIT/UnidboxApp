import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/check_out_order_state.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../repository/provider/stock_order_provider.dart';
import '../widgets/inventory_app_bar_widget copy.dart';
import 'stack_order_line_detail_widget.dart';

class CheckOutOrderDetailScreen extends ConsumerStatefulWidget {
  final List<Map<String, dynamic>> orderLine;
  final Map<String, Map<String, dynamic>> checkOutDataMap;
  const CheckOutOrderDetailScreen({
    super.key,
    required this.orderLine,
    required this.checkOutDataMap,
  });

  @override
  ConsumerState<CheckOutOrderDetailScreen> createState() =>
      _CheckOutOrderDetailScreenState();
}

class _CheckOutOrderDetailScreenState
    extends ConsumerState<CheckOutOrderDetailScreen> {
  double totalPrice = 0.0;
  bool isSubmit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var data in widget.orderLine) {
      totalPrice += (data['product_qty'] * data["price_unit"]);
    }
    superPrint(totalPrice);
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
              }, () {}, CupertinoIcons.qrcode_viewfinder),
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
                          ref
                              .read(checkoutOrderStateNotifierProvider.notifier)
                              .checkOutOrder(admin.companyId, admin.partnerId,
                                  widget.orderLine, context, ref);
                        }, isBool: isSubmit),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                  offset: Offset(0, 14.h),
                  child: orderLineDetailWidget(widget.checkOutDataMap)),
            ])),
      ),
    );
  }

  Widget orderLineDetailWidget(
      Map<String, Map<String, dynamic>> orderLineList) {
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
          itemBuilder: (context, index) {
            orderLineList.entries.elementAt(index);
            int totalQty =
                orderLineList.entries.elementAt(index).value['product_qty'];
            String image =
                orderLineList.entries.elementAt(index).value['image'];
            String name = orderLineList.entries.elementAt(index).value['name'];
            String sku = orderLineList.entries.elementAt(index).value['sku'];
            double price =
                orderLineList.entries.elementAt(index).value['price_unit'];
            superPrint(totalQty);
            return Column(
              children: [
                stackOrderLineWidget(
                    name, image, totalQty, price, sku, orderLineList, index),
                Container(
                  height: 25.h,
                  color: Colors.red,
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 0);
          },
          itemCount: orderLineList.length),
    );
  }
}
