import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/constant/app_color.dart';
import '../../../widgets/text_widget.dart';
import '../domain/order_receiving.dart';
import 'widgets/receiving_product_line_widget.dart';
import 'widgets/shimmer_order_receiving_widget.dart';

class ReceivingHistoryScreen extends ConsumerStatefulWidget {
  final bool isPendingLoading;
  final List<OrderReceiving> pendingOrderReceivingList;
  const ReceivingHistoryScreen(
      {super.key,
      required this.isPendingLoading,
      required this.pendingOrderReceivingList});

  @override
  ConsumerState<ReceivingHistoryScreen> createState() =>
      _ReceivingHistoryScreenState();
}

class _ReceivingHistoryScreenState
    extends ConsumerState<ReceivingHistoryScreen> {
  List<int> visiblityIndex = [];

  @override
  Widget build(BuildContext context) {
    return widget.isPendingLoading
        ? shimmerOrderReceivingWidget()
        : ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) {
              return !visiblityIndex.contains(index)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          visiblityIndex.add(index);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 3,
                                  spreadRadius: 3)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            eachOrderNoWidget(
                                "P02/23/00012", "22 Oct 2023", index),
                            const SizedBox(height: 10),
                            textWidget(
                              "Amax Machinery Pte Ltd",
                              color: AppColor.orangeColor,
                              fontWeight: FontWeight.w600,
                              size: 14,
                            ),
                            const SizedBox(height: 5),
                            eachOrderAmountWidget("\$128.50"),
                            const SizedBox(height: 10),
                            invoiceNumberOrderWidget(),
                            const SizedBox(height: 10),
                            doNumberOrderWidget(),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          visiblityIndex.remove(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.bottomSheetBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  eachOrderNoWidget(
                                      "P02/23/00012", "22 Oct 2023", index),
                                  const SizedBox(height: 10),
                                  textWidget(
                                    "Amax Machinery Pte Ltd",
                                    color: AppColor.orangeColor,
                                    fontWeight: FontWeight.w600,
                                    size: 14,
                                  ),
                                  const SizedBox(height: 5),
                                  eachOrderAmountWidget("\$128.50"),
                                  const SizedBox(height: 10),
                                  invoiceNumberOrderWidget(),
                                  const SizedBox(height: 10),
                                  doNumberOrderWidget(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.bottomSheetBgColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, productIndex) {
                                    String imageUrl = "";
                                    String name = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .products[1];
                                    String defaultCode = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .defaultCode;
                                    String price = widget
                                        .pendingOrderReceivingList[index]
                                        .productList[productIndex]
                                        .price
                                        .toStringAsFixed(2);
                                    String qty = "1";
                                    return receivingProductLineWidget(imageUrl,
                                        name, defaultCode, price, qty);
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 15);
                                  },
                                  itemCount: widget
                                      .pendingOrderReceivingList[index]
                                      .productList
                                      .length),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: widget.pendingOrderReceivingList.length);
  }

  Widget eachOrderAmountWidget(String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget("Total amount(GST Excluded) :", size: 13.5),
        textWidget(price, size: 13.5, fontWeight: FontWeight.w700),
      ],
    );
  }

  Widget eachOrderNoWidget(String orderCode, String date, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              orderCode,
              color: AppColor.pinkColor,
              fontWeight: FontWeight.w700,
              size: 15,
            ),
            textWidget(date, size: 12)
          ],
        ),
        !visiblityIndex.contains(index)
            ? const SizedBox.shrink()
            : Icon(
                Icons.download,
                color: AppColor.pinkColor,
              ),
      ],
    );
  }

  Widget invoiceNumberOrderWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget("Invoice Number :", size: 13),
            textWidget("I02/23/00012", fontWeight: FontWeight.w600, size: 14),
          ],
        ),
      ],
    );
  }

  Widget doNumberOrderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget("DO Number :", size: 13),
        textWidget("D02/23/00012", fontWeight: FontWeight.w600, size: 14),
      ],
    );
  }
}
