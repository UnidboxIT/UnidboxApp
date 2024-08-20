import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../inventory_tracker/presentation/details/product_detail_screen.dart';
import '../../../my_request/presentation/widgets/each_product_line_widget.dart';
import '../../repository/provider/outlet_return_provider.dart';
import 'show_attachment_image_dialog.dart';

Widget eachOutletReturnWidget(
    String requestCode,
    String name,
    String currentDate,
    bool isNewReturn,
    List productList,
    WidgetRef ref,
    BuildContext context,
    {bool isAcceptLoading = false,
    int acceptProductID = -1}) {
  return ListView.separated(
      itemCount: productList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (context, index) {
        double returnQty =
            productList[index].issueQty - productList[index].receivedQty;
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        textWidget(
                          productList[index].model == "false"
                              ? ""
                              : productList[index].model,
                          fontWeight: FontWeight.w500,
                          size: 12,
                        ),
                        textWidget(
                          isNewReturn ||
                                  productList[index].status == "return_issued"
                              ? "Returned Qty : ${productList[index].qty.toInt()} ${productList[index].productUomList[1]}"
                              : "Returned Qty : ${returnQty.toInt()} ${productList[index].productUomList[1]}",
                          size: 13,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        const SizedBox(height: 10),
                        textWidget(
                          "Receive Qty :",
                          size: 13,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addMinusIconButtonWidget(
                                () {},
                                CupertinoIcons.minus_circle_fill,
                                AppColor.pinkColor),
                            const SizedBox(width: 10),
                            textWidget(
                                isNewReturn ||
                                        productList[index].status ==
                                            "return_issued"
                                    ? productList[index].qty.toInt().toString()
                                    : returnQty.toInt().toString(),
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                size: 13),
                            const SizedBox(width: 10),
                            addMinusIconButtonWidget(
                                () {},
                                CupertinoIcons.add_circled_solid,
                                AppColor.pinkColor),
                            textWidget(productList[index].productUomList[1],
                                size: 13),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    "Returned From",
                    color: AppColor.orangeColor,
                    size: 12.5,
                  ),
                  textWidget(
                    isNewReturn
                        ? productList[index].requestWarehouse[1]
                        : productList[index].warehouseList[1],
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Returned By",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(
                            "Reason",
                            color: AppColor.orangeColor,
                            size: 12.5,
                          ),
                          textWidget(
                            productList[index].reason == "false"
                                ? ""
                                : productList[index]
                                    .reason
                                    .replaceAll("[", "")
                                    .replaceAll("]", "")
                                    .replaceAll("'", ""),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              productList[index].status == 'return_accepted' ||
                      productList[index].status == 'return_issued'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 67.w,
                          child: buttonWidget(
                            "Receive",
                            productList[index].status != 'return_issued'
                                ? () {}
                                : () {
                                    isAcceptLoading &&
                                            acceptProductID ==
                                                productList[index].id
                                        ? () {}
                                        : ref
                                            .read(outletReturnStateNotifier
                                                .notifier)
                                            .outletReturnReceived(
                                                productList[index].id, context);
                                  },
                            isBool: isAcceptLoading &&
                                acceptProductID == productList[index].id,
                            bgColor:
                                productList[index].status != 'return_issued'
                                    ? Colors.grey.shade400
                                    : AppColor.pinkColor,
                            fontColor: Colors.white,
                            elevation: 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showAttachmentImageDialog(
                                context, productList[index].attachmentFile);
                          },
                          child: Container(
                            width: 10.w,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.pinkColor,
                            ),
                            child: const Icon(
                              Icons.file_present_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 67.w,
                          child: buttonWidget(
                            "Accept",
                            () {
                              isAcceptLoading &&
                                      acceptProductID == productList[index].id
                                  ? () {}
                                  : ref
                                      .read(outletReturnStateNotifier.notifier)
                                      .outletReturnAccepted(
                                          productList[index].id, context);
                            },
                            isBool: isAcceptLoading &&
                                acceptProductID == productList[index].id,
                            bgColor: AppColor.pinkColor,
                            fontColor: Colors.white,
                            elevation: 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showAttachmentImageDialog(
                                context, productList[index].attachmentFile);
                          },
                          child: Container(
                            width: 10.w,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.pinkColor,
                            ),
                            child: const Icon(
                              Icons.file_present_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        );
      });
}
