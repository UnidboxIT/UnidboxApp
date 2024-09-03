import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';
import '../../../internal_transfer/my_request/presentation/widgets/each_product_line_widget.dart';

Map<String, List<bool>> goodReturnMap = {};
Widget stackOrderLineWidget(
    String vendorName, List<Map<String, dynamic>> orderLineList) {
  return Consumer(
    builder: (context, ref, child) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, eachIndex) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 36.5.h,
                          //height: 22.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: AppColor.pinkColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  superPrint("Goods return");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.bottomCenter,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_box_outline_blank_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      textWidget(
                                        "Goods Return",
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(
                                    "Products",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    height: 45,
                                    width: 100.w,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: textWidget(
                                      orderLineList[eachIndex]['name'],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              dropdownOrderFormReturnWidget()
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: AppColor.bottomSheetBgColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
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
                                  image: DecorationImage(
                                      image: orderLineList[eachIndex]
                                                  ['image'] !=
                                              "false"
                                          ? NetworkImage(
                                              orderLineList[eachIndex]['image'])
                                          : const AssetImage(
                                              'assets/images/app_icon.jpeg'),
                                      fit: BoxFit.cover),
                                ),
                                height: 11.h,
                                width: 20.w,
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(orderLineList[eachIndex]['name'],
                                        size: 15,
                                        fontWeight: FontWeight.bold,
                                        maxLine: 2,
                                        textOverflow: TextOverflow.fade,
                                        textAlign: TextAlign.left),
                                    textWidget(orderLineList[eachIndex]['sku'],
                                        size: 13, color: Colors.grey),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        textWidget(
                                          "\$ ${orderLineList[eachIndex]['price_unit']}",
                                          fontWeight: FontWeight.bold,
                                          size: 15,
                                        ),
                                        const Spacer(),
                                        addMinusOrderFormIconButtonWidget(
                                          CupertinoIcons.minus_circle_fill,
                                        ),
                                        const SizedBox(width: 10),
                                        textWidget(orderLineList[eachIndex]
                                                ['product_qty']
                                            .toString()),
                                        const SizedBox(width: 10),
                                        addMinusOrderFormIconButtonWidget(
                                          CupertinoIcons.add_circled_solid,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: orderLineList.length,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              width: 100.w,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColor.pinkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: textWidget(
                vendorName,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 16,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget addMinusOrderFormIconButtonWidget(IconData iconData) {
  return Icon(
    iconData,
    color: AppColor.orangeColor,
    size: 23,
  );
}

Widget dropdownOrderFormReturnWidget() {
  return Row(
    children: [
      Container(
        width: 42.w,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
              isExpanded: true,
              autofocus: true,
              isDense: true,
              dropdownStyleData: DropdownStyleData(
                width: 80.w,
                offset: const Offset(-10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
              ),
              hint: Text(
                'Select Reason',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColor.fontColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500),
              ),
              items: const [],
              onChanged: (_) {}),
        ),
      ),
      const SizedBox(width: 7),
      Row(
        children: [
          addMinusIconButtonWidget(
              () {}, CupertinoIcons.minus_circle_fill, Colors.white),
          Container(
            width: 15.w,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: textWidget(
              "1",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              size: 14,
            ),
          ),
          addMinusIconButtonWidget(
              () {}, CupertinoIcons.add_circled_solid, Colors.white),
        ],
      )
    ],
  );
}
