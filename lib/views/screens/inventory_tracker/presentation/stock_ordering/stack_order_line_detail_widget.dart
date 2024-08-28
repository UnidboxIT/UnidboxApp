import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';

Widget stackOrderLineWidget(
    String name,
    String image,
    int totalQty,
    double price,
    String sku,
    Map<String, Map<String, dynamic>> orderLineList,
    int index) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: AppColor.bottomSheetBgColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, eachIndex) {
                  return Container(
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
                                image: image != "false"
                                    ? NetworkImage(image)
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
                              textWidget(name,
                                  size: 15,
                                  fontWeight: FontWeight.bold,
                                  maxLine: 2,
                                  textOverflow: TextOverflow.fade,
                                  textAlign: TextAlign.left),
                              textWidget(sku, size: 13, color: Colors.grey),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  textWidget(
                                    "\$ $price",
                                    fontWeight: FontWeight.bold,
                                    size: 15,
                                  ),
                                  const Spacer(),
                                  addMinusIconButtonWidget(
                                    CupertinoIcons.minus_circle_fill,
                                  ),
                                  const SizedBox(width: 10),
                                  textWidget("1"),
                                  const SizedBox(width: 10),
                                  addMinusIconButtonWidget(
                                    CupertinoIcons.add_circled_solid,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: totalQty,
              ),
            ],
          ),
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
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: textWidget(
            orderLineList.entries.elementAt(index).key,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ),
      ),
    ],
  );
}

Widget addMinusIconButtonWidget(IconData iconData) {
  return Icon(
    iconData,
    color: AppColor.orangeColor,
    size: 23,
  );
}
