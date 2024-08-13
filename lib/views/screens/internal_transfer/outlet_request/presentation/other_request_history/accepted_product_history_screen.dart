import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../my_request/domain/my_request.dart';

class AcceptedProductHistoryScreen extends ConsumerStatefulWidget {
  final List<Map<String, dynamic>> requestedHistoryList;
  const AcceptedProductHistoryScreen(
      {super.key, required this.requestedHistoryList});

  @override
  ConsumerState<AcceptedProductHistoryScreen> createState() =>
      _AcceptedProductHistoryScreenState();
}

class _AcceptedProductHistoryScreenState
    extends ConsumerState<AcceptedProductHistoryScreen> {
  List<String> visibleCode = [];

  loadSetVisiblity(String code) {
    setState(() {
      visibleCode.add(code);
    });
  }

  removeVisiblity(String code) {
    setState(() {
      visibleCode.remove(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    superPrint(widget.requestedHistoryList);
    return requestHistoryWidget(widget.requestedHistoryList);
  }

  Widget requestHistoryWidget(
    List<Map<String, dynamic>> requestedMapList,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const ClampingScrollPhysics(),
      itemCount: requestedMapList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
      itemBuilder: (context, index) {
        Map<String, dynamic> warehouseMap = requestedMapList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: warehouseMap.entries.map((entry) {
            String date = entry.key;
            Map<dynamic, dynamic> warehouseData = entry.value;
            Map<dynamic, dynamic> productLineMap =
                warehouseData['product_line'];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 4.h),
                    decoration: BoxDecoration(
                      color: AppColor.pinkColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(date)),
                          size: 14,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        textWidget("Request From"),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -3.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productLineMap.keys.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 0);
                        },
                        itemBuilder: (context, productIndex) {
                          String productLineKey =
                              productLineMap.keys.elementAt(productIndex);
                          List<dynamic> productList =
                              productLineMap[productLineKey]['products'] ?? [];
                          superPrint(productList);
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (visibleCode.contains(productLineKey)) {
                                    removeVisiblity(productLineKey);
                                  } else {
                                    loadSetVisiblity(productLineKey);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: visibleCode
                                              .contains(productLineKey)
                                          ? [
                                              BoxShadow(
                                                  color:
                                                      AppColor.dropshadowColor,
                                                  blurRadius: 3,
                                                  spreadRadius: 3)
                                            ]
                                          : []),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget(
                                        productLineKey,
                                        size: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textWidget(
                                        productLineMap[productLineKey]
                                            ['warehouse_name'],
                                        size: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: visibleCode.contains(productLineKey),
                                  child: const SizedBox(height: 10)),
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: productList.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 0);
                                  },
                                  itemBuilder: (context, subIndex) {
                                    return Visibility(
                                      visible:
                                          visibleCode.contains(productLineKey),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            left: -2.w,
                                            child: Container(
                                              height: 17.h,
                                              width: 5.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: productList[subIndex]
                                                            .status ==
                                                        "accepted"
                                                    ? AppColor.orangeColor
                                                    : Colors.grey.shade300,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  topLeft: Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: -9.w,
                                            child: Transform.rotate(
                                              angle: 80.1,
                                              child: textWidget("ACCEPTED",
                                                  size: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white,
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 0),
                                            child: eachHistoryWidget(
                                                productList[subIndex]),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Visibility(
                                  visible: visibleCode.contains(productLineKey),
                                  child: const SizedBox(height: 5))
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget eachHistoryWidget(ProductLineId product) {
    List<Widget> attributeTexts = [];
    for (int i = 0; i < product.productIdList[5].length; i++) {
      attributeTexts.add(Text(product.productIdList[5][i],
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          )));
      if (i != product.productIdList[5].length - 1) {
        attributeTexts.add(const Text(', ',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )));
      }
    }
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
              width: 100.w,
              child: textWidget(
                product.productIdList[4],
                size: 14,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
              )),
        ),
        Row(
          children: [
            textWidget(
              "Model ",
              fontWeight: FontWeight.w700,
              color: AppColor.pinkColor,
            ),
            const SizedBox(width: 15),
            textWidget(
              product.model == "false" ? "" : product.model,
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              "Attribute ",
              fontWeight: FontWeight.w700,
              color: AppColor.pinkColor,
            ),
            const SizedBox(width: 5),
            product.productIdList[5] == []
                ? textWidget("")
                : Expanded(
                    child: Wrap(
                      children: attributeTexts,
                    ),
                  )
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.pinkColor.withOpacity(0.2)),
                  child: textWidget(
                    "Request Qty : ${product.qty.toInt()} ${product.productUomList[1]}",
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    size: 13.5,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.pinkColor.withOpacity(0.2)),
                  child: textWidget(
                    "Accepted Qty : ${product.issueQty.toInt()} ${product.productUomList[1]}",
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    size: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
