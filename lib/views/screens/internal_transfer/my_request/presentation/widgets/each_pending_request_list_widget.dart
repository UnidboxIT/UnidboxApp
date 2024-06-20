import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../domain/my_request.dart';
import '../../repository/provider/my_request_provider.dart';
import '../../repository/state/my_request_state.dart';
import '../../repository/state/request_pending_state.dart';

Widget eachPendingRequestListWidget(
    String requestCode,
    String name,
    String currentDate,
    String requestWarehouse,
    List<ProductLineId> productList,
    {int acceptProductID = -1}) {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Consumer(builder: (context, ref, child) {
          bool isEdit = false;
          final state = ref.watch(myRequestStateNotifierProvider);
          final requestPendingState =
              ref.watch(requestPendingStateNotifierProvider);
          ProductLineId product = productList[index];
          if (state is IncrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              product.qty = state.qty;
            } else {
              product = productList[index];
            }
          }
          if (state is DecrementQty) {
            int stateIndex = state.index;
            if (product.id == stateIndex) {
              product.qty = state.qty;
            } else {
              product = productList[index];
            }
          }
          if (requestPendingState is IsRequestUpdate) {
            int stateIndex = requestPendingState.productID;
            if (product.id == stateIndex) {
              isEdit = requestPendingState.isRequestUpdate;
            } else {
              isEdit = false;
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
                            textWidget(productList[index].productIdList[1],
                                size: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                maxLine: 2,
                                textOverflow: TextOverflow.fade,
                                textAlign: TextAlign.left),
                            textWidget(productList[index].code,
                                size: 12,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            textWidget(
                              productList[index].model,
                              fontWeight: FontWeight.w500,
                              size: 13,
                            ),
                            const SizedBox(height: 10),
                            !isEdit
                                ? textWidget("${product.qty} pc",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    size: 13)
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      addMinusIconButtonWidget(() {
                                        ref
                                            .read(myRequestStateNotifierProvider
                                                .notifier)
                                            .decrementTotalQty(
                                                productList[index].id,
                                                product.qty);
                                      }, CupertinoIcons.minus_circle_fill,
                                          AppColor.primary),
                                      const SizedBox(width: 5),
                                      textWidget(product.qty.toString(),
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold,
                                          size: 13),
                                      const SizedBox(width: 5),
                                      addMinusIconButtonWidget(() {
                                        ref
                                            .read(myRequestStateNotifierProvider
                                                .notifier)
                                            .incrementTotalQty(
                                                productList[index].id,
                                                product.qty);
                                      }, CupertinoIcons.add_circled_solid,
                                          AppColor.primary),
                                      textWidget("pc")
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Request to",
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
                      isEdit
                          ? SizedBox(
                              width: 30.w,
                              height: 35,
                              child: buttonWidget(
                                "Update",
                                () {
                                  ref
                                      .read(myRequestStateNotifierProvider
                                          .notifier)
                                      .pendingRequestUpdate(product.id,
                                          product.qty.toInt(), context)
                                      .then((_) {
                                    ref
                                        .read(
                                            requestPendingStateNotifierProvider
                                                .notifier)
                                        .myRequestPending(false,
                                            productID: product.id);
                                  });
                                },
                                isBool: product.id == acceptProductID,
                                elevation: 1,
                                bgColor: Colors.white,
                                fontColor: Colors.black,
                              ),
                            )
                          : SizedBox(
                              width: 30.w,
                              height: 35,
                              child: buttonWidget(
                                "Edit",
                                () {
                                  ref
                                      .read(requestPendingStateNotifierProvider
                                          .notifier)
                                      .myRequestPending(true,
                                          productID: product.id);
                                },
                                elevation: 1,
                                bgColor: Colors.white,
                                fontColor: Colors.black,
                              ),
                            )
                    ],
                  ),
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
