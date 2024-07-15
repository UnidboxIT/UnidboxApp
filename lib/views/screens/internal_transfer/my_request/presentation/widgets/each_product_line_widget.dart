import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/presentation/receive_scan_screen.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/presentation/details/product_detail_screen.dart';
import '../../domain/my_request.dart';
import '../../repository/state/my_request_state.dart';

Widget eachProductLineWidget(
    String requestCode,
    String name,
    String currentDate,
    String requestWarehouse,
    List<ProductLineId> productList,
    {bool isPending = false,
    bool myRequestLoading = false,
    int acceptProductID = -1}) {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Consumer(builder: (context, ref, child) {
          final state = ref.watch(myRequestStateNotifierProvider);
          ProductLineId product = productList[index];
          if (state is IncrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              product.receivedQty = state.qty;
            } else {
              product = productList[index];
            }
          }
          if (state is DecrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              product.receivedQty = state.qty;
            } else {
              product = productList[index];
            }
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        requestCode,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        size: 20,
                      ),
                      textWidget(
                          DateFormat('dd MMM yyyy').format(
                            DateTime.parse(currentDate),
                          ),
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          size: 17)
                    ],
                  ),
                  const SizedBox(height: 13),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.dropshadowColor,
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: productList[index].imageUrl != "false"
                                  ? NetworkImage(productList[index].imageUrl)
                                  : const AssetImage(
                                      'assets/images/app_icon.jpeg'),
                              fit: BoxFit.cover),
                        ),
                        height: 13.h,
                        width: 22.w,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      productID: productList[index]
                                          .productIdList[0]
                                          .toString(),
                                      productName:
                                          productList[index].productIdList[1],
                                      isInternalTransfer: true,
                                    ),
                                  ),
                                );
                              },
                              child: textWidget(
                                  productList[index].productIdList[1],
                                  size: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  textOverflow: TextOverflow.fade,
                                  textAlign: TextAlign.left),
                            ),
                            textWidget(productList[index].code,
                                size: 12,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            Visibility(
                              visible: productList[index].model != "false",
                              child: productList[index].model.isEmpty
                                  ? const SizedBox.shrink()
                                  : textWidget(
                                      productList[index].model,
                                      fontWeight: FontWeight.w500,
                                      size: 13,
                                    ),
                            ),
                            const SizedBox(height: 10),
                            productList[index].status != 'receiving'
                                ? textWidget(
                                    "Received Qty: ${product.issueQty.toString()} ${product.productUomList[1]}",
                                    size: 12,
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textWidget(
                                        "Received Qty: ${product.issueQty.toString()} ${product.productUomList[1]}",
                                        size: 12,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          addMinusIconButtonWidget(() {
                                            if (productList[index].status ==
                                                'receiving') {
                                              ref
                                                  .read(
                                                      myRequestStateNotifierProvider
                                                          .notifier)
                                                  .decrementTotalQty(
                                                      productList[index].id,
                                                      product.receivedQty);
                                            }
                                          },
                                              CupertinoIcons.minus_circle_fill,
                                              productList[index].status ==
                                                      'receiving'
                                                  ? AppColor.primary
                                                  : AppColor.pinkColor),
                                          const SizedBox(width: 15),
                                          textWidget(
                                              product.receivedQty
                                                  .toInt()
                                                  .toString(),
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.bold,
                                              size: 13),
                                          const SizedBox(width: 15),
                                          addMinusIconButtonWidget(() {
                                            superPrint(product.issueQty);
                                            if (productList[index].status ==
                                                    'receiving' &&
                                                product.issueQty >
                                                    product.receivedQty) {
                                              ref
                                                  .read(
                                                      myRequestStateNotifierProvider
                                                          .notifier)
                                                  .incrementTotalQty(
                                                      productList[index].id,
                                                      product.receivedQty);
                                            }
                                          },
                                              CupertinoIcons.add_circled_solid,
                                              productList[index].status ==
                                                      'receiving'
                                                  ? AppColor.primary
                                                  : AppColor.pinkColor)
                                        ],
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Request To",
                            color: AppColor.orangeColor,
                            size: 12.5,
                          ),
                          textWidget(
                            requestWarehouse,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          ),
                          textWidget(
                            "Request By",
                            color: AppColor.orangeColor,
                            size: 12.5,
                          ),
                          textWidget(
                            name,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          )
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Visibility(
                        //visible: productList[index].status != 'receiving',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(
                              "Status",
                              color: AppColor.orangeColor,
                              size: 12.5,
                            ),
                            textWidget(
                              capitalizeFirstLetter(productList[index].status),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              size: 14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Visibility(
                      visible: productList[index].status == 'receiving',
                      child: const SizedBox(height: 10)),
                  Visibility(
                    visible: productList[index].status == 'receiving',
                    child: SizedBox(
                      width: 80.w,
                      child: product.issueQty != product.receivedQty
                          ? buttonWidget(
                              "Receive",
                              () {
                                isPending && product.id == acceptProductID
                                    ? () {}
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReceiveScanScreen(
                                            productID: product.id,
                                            qty: product.receivedQty.toInt(),
                                            productName:
                                                product.productIdList[1],
                                          ),
                                        ),
                                      );
                              },
                              isBool:
                                  isPending && product.id == acceptProductID,
                              elevation: 0,
                              bgColor: AppColor.pinkColor,
                              fontColor: Colors.white,
                            )
                          : buttonWidget(
                              "Receive",
                              () {
                                myRequestLoading &&
                                        product.id == acceptProductID
                                    ? () {}
                                    : ref
                                        .read(myRequestStateNotifierProvider
                                            .notifier)
                                        .doneMyRequest(
                                            product.id,
                                            product.receivedQty.toInt(),
                                            context);
                              },
                              isBool: myRequestLoading &&
                                  product.id == acceptProductID,
                              elevation: 0,
                              bgColor: AppColor.pinkColor,
                              fontColor: Colors.white,
                            ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: productList.length);
}

String capitalizeFirstLetter(String word) {
  if (word.isEmpty) {
    return word; // Return empty string if input is empty
  }
  return word[0].toUpperCase() + word.substring(1);
}

Widget addMinusIconButtonWidget(
    VoidCallback onPressed, IconData iconData, Color iconColor) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      width: 10.w,
      height: 40,
      color: Colors.transparent,
      child: Icon(
        iconData,
        color: iconColor,
        size: 30,
      ),
    ),
  );
}
