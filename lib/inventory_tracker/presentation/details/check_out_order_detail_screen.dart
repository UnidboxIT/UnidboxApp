import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/stock_order_provider.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../utils/constant/app_color.dart';
import '../../../views/widgets/button/button_widget.dart';
import '../../../views/widgets/text_widget.dart';
import '../widgets/inventory_app_bar_widget copy.dart';

class CheckOutOrderDetailScreen extends ConsumerStatefulWidget {
  // final int companyID;
  // final int partnerId;
  final List<Map<String, dynamic>> orderLine;
  final Map<String, Map<String, dynamic>> checkOutDataMap;
  const CheckOutOrderDetailScreen({
    super.key,
    // required this.companyID,
    // required this.partnerId,
    required this.orderLine,
    required this.checkOutDataMap,
  });

  @override
  ConsumerState<CheckOutOrderDetailScreen> createState() =>
      _CheckOutOrderDetailScreenState();
}

class _CheckOutOrderDetailScreenState
    extends ConsumerState<CheckOutOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.primary,
      child: Scaffold(
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
                  height: 8.h,
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
                      textWidget("\$ 300",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          size: 16),
                      const Spacer(),
                      // buttonWidget("Submit", () {
                      //   ref
                      //       .read(checkoutOrderStateNotifierProvider.notifier)
                      //       .checkOutOrder(
                      //         widget.companyID,
                      //         widget.partnerId,
                      //         widget.orderLine,
                      //         context,
                      //       );
                      // }),
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
      height: 74.h,
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
            superPrint(orderLineList.entries.elementAt(index).value);
            return Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      color: AppColor.bottomSheetBgColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, eachIndex) {
                            return Container(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.dropshadowColor,
                                          blurRadius: 5,
                                          spreadRadius: 5,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo1xt3vxTKed2Dq6Qphc1IgbLU0LKwVVRg1-kxBwFeTg&s",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    height: 11.h,
                                    width: 20.w,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textWidget(
                                            orderLineList.entries
                                                .elementAt(index)
                                                .value['name'],
                                            size: 15,
                                            fontWeight: FontWeight.bold,
                                            maxLine: 2,
                                            textOverflow: TextOverflow.fade,
                                            textAlign: TextAlign.left),
                                        textWidget("08-22-00123",
                                            size: 13, color: Colors.grey),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            textWidget(
                                              "\$ ${orderLineList.entries.elementAt(index).value['price_unit']}",
                                              fontWeight: FontWeight.bold,
                                              size: 15,
                                            ),
                                            const Spacer(),
                                            addMinusIconButtonWidget(
                                              CupertinoIcons.minus_circle_fill,
                                            ),
                                            const SizedBox(width: 10),
                                            textWidget("1"),
                                            const SizedBox(width: 10),
                                            addMinusIconButtonWidget(
                                              CupertinoIcons.add_circled_solid,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: orderLineList.entries
                              .elementAt(index)
                              .value['product_qty'],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    width: 100.w,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColor.pinkColor,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: textWidget(
                      orderLineList.entries.elementAt(index).key,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: orderLineList.length),
    );
  }

  Widget addMinusIconButtonWidget(IconData iconData) {
    return Icon(
      iconData,
      color: AppColor.orangeColor,
      size: 23,
    );
  }
}