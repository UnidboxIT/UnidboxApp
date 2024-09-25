import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/presentation/details/product_detail_screen.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../domain/my_request.dart';
import '../../repository/state/my_request_state.dart';
import '../return_request_screen.dart';

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
        ProductLineId product = productList[index];
        Map<int, double> receiveQtyMap = {product.id: product.issueQty};
        return Consumer(builder: (context, ref, child) {
          final state = ref.watch(myRequestStateNotifierProvider);
          if (state is IncrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              receiveQtyMap = {stateIndex: state.qty};
            } else {
              receiveQtyMap = {product.id: product.issueQty};
            }
          }
          if (state is DecrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              receiveQtyMap = {stateIndex: state.qty};
            } else {
              receiveQtyMap = {product.id: product.issueQty};
            }
          }

          return Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                          height: 14.5.h,
                          width: 25.w,
                        ),
                        const SizedBox(height: 15),
                        textWidget(
                          "Request To",
                          color: AppColor.orangeColor,
                          size: 12.5,
                        ),
                        SizedBox(
                          width: 25.w,
                          child: textWidget(requestWarehouse,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              size: 14,
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
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
                          productList[index].status != 'issued'
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      "Requested Qty: ${product.qty.toInt()} ${product.productUomList[1]}",
                                      size: 12,
                                    ),
                                    textWidget(
                                      "Issued Qty : ${product.issueQty.toInt()} ${product.productUomList[1]}",
                                      size: 12,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      "Requested Qty : ${product.qty.toInt()} ${product.productUomList[1]}",
                                      size: 12,
                                    ),
                                    textWidget(
                                      "Issued Qty : ${product.issueQty.toInt()} ${product.productUomList[1]}",
                                      size: 12,
                                    ),
                                    const SizedBox(height: 5),
                                    textWidget(
                                      "Receive Qty :",
                                      size: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        addMinusIconButtonWidget(() {
                                          if (productList[index].status ==
                                              'issued') {
                                            ref
                                                .read(
                                                    myRequestStateNotifierProvider
                                                        .notifier)
                                                .decrementTotalQty(
                                                    productList[index].id,
                                                    receiveQtyMap[
                                                        productList[index]
                                                            .id]!);
                                          }
                                        },
                                            CupertinoIcons.minus_circle_fill,
                                            productList[index].status ==
                                                    'issued'
                                                ? AppColor.primary
                                                : AppColor.pinkColor),
                                        const SizedBox(width: 15),
                                        textWidget(
                                            receiveQtyMap[
                                                    productList[index].id]!
                                                .toInt()
                                                .toString(),
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.bold,
                                            size: 13),
                                        const SizedBox(width: 15),
                                        addMinusIconButtonWidget(() {
                                          superPrint(product.issueQty);
                                          if (productList[index].status ==
                                                  'issued' &&
                                              product.issueQty >
                                                  receiveQtyMap[
                                                      productList[index].id]!) {
                                            ref
                                                .read(
                                                    myRequestStateNotifierProvider
                                                        .notifier)
                                                .incrementTotalQty(
                                                    productList[index].id,
                                                    receiveQtyMap[
                                                        productList[index]
                                                            .id]!);
                                          }
                                        },
                                            CupertinoIcons.add_circled_solid,
                                            productList[index].status ==
                                                    'issued'
                                                ? AppColor.primary
                                                : AppColor.pinkColor),
                                        textWidget(
                                          product.productUomList[1],
                                          size: 12,
                                        )
                                      ],
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    const Spacer(),
                    Column(
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
                    SizedBox(width: 10.w)
                  ],
                ),
                Visibility(
                    visible: productList[index].status == 'issued',
                    child: const SizedBox(height: 10)),
                Visibility(
                  visible: productList[index].status == 'issued',
                  child: SizedBox(
                    width: 80.w,
                    child: product.issueQty != receiveQtyMap[product.id]
                        ? buttonWidget(
                            "Receive",
                            () {
                              ref
                                  .read(bottomBarVisibilityProvider.notifier)
                                  .state = false;
                              isPending && product.id == acceptProductID
                                  ? () {}
                                  : Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReturnRequestScreen(
                                                productCode: requestCode,
                                                currentDate: currentDate,
                                                requestWarehouse:
                                                    requestWarehouse,
                                                productLine: product,
                                                currentWarehouse: name,
                                                receiveReasonQty: productList[
                                                            index]
                                                        .issueQty -
                                                    receiveQtyMap[product.id]!,
                                                receiveQty: productList[index]
                                                    .receivedQty
                                                    .toInt(),
                                              )),
                                    );
                            },
                            isBool: isPending && product.id == acceptProductID,
                            elevation: 0,
                            bgColor: AppColor.pinkColor,
                            fontColor: Colors.white,
                          )
                        : buttonWidget(
                            "Receive",
                            () {
                              myRequestLoading && product.id == acceptProductID
                                  ? () {}
                                  : ref
                                      .read(myRequestStateNotifierProvider
                                          .notifier)
                                      .doneMyRequest(product.id,
                                          product.receivedQty.toInt(), context);
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
