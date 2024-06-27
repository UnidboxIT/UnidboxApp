import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/presentation/details/product_detail_screen.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/presentation/widgets/each_product_line_widget.dart';
import '../../repository/provider/outlet_return_provider.dart';

Widget eachOutletReturnWidget(String code, String name, String currentDate,
    ProductLineId productLine, WidgetRef ref, BuildContext context,
    {bool isAcceptLoading = false, int acceptProductID = -1}) {
  double returnQty = productLine.issueQty - productLine.receivedQty;
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                code,
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
                      image: productLine.imageUrl != "false"
                          ? NetworkImage(productLine.imageUrl)
                          : const AssetImage('assets/images/app_icon.jpeg'),
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
                              productID:
                                  productLine.productIdList[0].toString(),
                              productName: productLine.productIdList[1],
                              isInternalTransfer: true,
                            ),
                          ),
                        );
                      },
                      child: textWidget(productLine.productIdList[1],
                          size: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          maxLine: 2,
                          textOverflow: TextOverflow.fade,
                          textAlign: TextAlign.left),
                    ),
                    textWidget(productLine.code,
                        size: 12,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                    textWidget(
                      productLine.model == "false" ? "" : productLine.model,
                      fontWeight: FontWeight.w500,
                      size: 12,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addMinusIconButtonWidget(
                            () {},
                            CupertinoIcons.minus_circle_fill,
                            productLine.status == 'accepted'
                                ? AppColor.primary
                                : AppColor.pinkColor),
                        const SizedBox(width: 10),
                        textWidget(returnQty.toString(),
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            size: 13),
                        const SizedBox(width: 10),
                        addMinusIconButtonWidget(
                            () {},
                            CupertinoIcons.add_circled_solid,
                            productLine.status == 'accepted'
                                ? AppColor.primary
                                : AppColor.pinkColor),
                        textWidget(productLine.productUomList[1], size: 13),
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
                    "Request From",
                    color: AppColor.orangeColor,
                    size: 12.5,
                  ),
                  textWidget(
                    productLine.warehouseList[1],
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
              const Spacer(),
              SizedBox(
                height: 35,
                width: 30.w,
                child: buttonWidget("Receive", () {
                  ref
                      .read(outletReturnStateNotifier.notifier)
                      .outletReturnReceived(productLine.id);
                },
                    isBool:
                        isAcceptLoading && acceptProductID == productLine.id),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
