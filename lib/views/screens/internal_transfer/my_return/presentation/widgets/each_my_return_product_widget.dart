import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/presentation/details/product_detail_screen.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../update_my_return_screen.dart';

Widget eachMyReturnProductLineWidget(String requestCode, String name,
    String currentDate, String requestWarehouse, List productList,
    {bool isPending = false,
    bool myRequestLoading = false,
    int acceptProductID = -1}) {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
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
                        "Return To",
                        color: AppColor.orangeColor,
                        size: 12.5,
                      ),
                      SizedBox(
                        width: 25.w,
                        child: textWidget(name,
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
                          child: textWidget(productList[index].productIdList[1],
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
                        textWidget(
                          "Return Qty: ${productList[index].qty.toInt() - productList[index].receivedQty.toInt()} ${productList[index].productUomList[1]}",
                          size: 12,
                        ),
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
                        requestWarehouse,
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
                        capitalizeFirstLetter("Pending"),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(width: 15.w)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        "Reason",
                        color: AppColor.orangeColor,
                        size: 12.5,
                      ),
                      textWidget(
                        "",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: 14,
                      )
                    ],
                  ),
                  const Spacer(),
                  Consumer(builder: (context, ref, data) {
                    return SizedBox(
                      width: 25.w,
                      height: 35,
                      child: buttonWidget(
                        "Edit",
                        () {
                          ref.read(bottomBarVisibilityProvider.notifier).state =
                              false;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UpdateMyReturnScreen(
                                    productCode: requestCode,
                                    currentDate: currentDate,
                                    requestWarehouse: requestWarehouse,
                                    productLine: productList[index],
                                    currentWarehouse: name,
                                    receiveQty: productList[index].qty -
                                        productList[index].receivedQty,
                                  )));
                        },
                      ),
                    );
                  }),
                  SizedBox(width: 3.5.w)
                ],
              ),
            ],
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