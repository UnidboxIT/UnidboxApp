import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/text_widget.dart';
import '../../domain/my_request.dart';

Widget eachPendingRequestListWidget(
  String requestCode,
  String name,
  String currentDate,
  String requestWarehouse,
  List<ProductLineId> productList,
) {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
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
                      height: 12.h,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textWidget(
                                "Requested Qty: ${productList[index].qty}",
                                size: 12,
                              ),
                              const SizedBox(width: 5),
                              addMinusIconButtonWidget(
                                  () {},
                                  CupertinoIcons.minus_circle_fill,
                                  productList[index].status == 'receiving'
                                      ? AppColor.primary
                                      : AppColor.pinkColor),
                              const SizedBox(width: 5),
                              textWidget(
                                  productList[index].receivedQty.toString(),
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                  size: 13),
                              const SizedBox(width: 5),
                              addMinusIconButtonWidget(
                                  () {},
                                  CupertinoIcons.add_circled_solid,
                                  productList[index].status == 'receiving'
                                      ? AppColor.primary
                                      : AppColor.pinkColor)
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
                          "Request from",
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
                          name,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          size: 14,
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
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
                    )
                  ],
                ),
              ],
            ),
          ),
        );
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
