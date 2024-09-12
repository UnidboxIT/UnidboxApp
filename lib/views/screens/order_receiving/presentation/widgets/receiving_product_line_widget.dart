import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/presentation/widgets/each_my_return_product_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../../utils/constant/app_color.dart';

Widget receivingProductLineWidget(
  String imageUrl,
  String name,
  String defaultCode,
  String price,
  String qty,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    //  height: 20.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 27.5.w,
          height: 15.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    blurRadius: 2,
                    spreadRadius: 2)
              ],
              image: DecorationImage(
                image: imageUrl.isEmpty
                    ? const AssetImage('assets/images/app_icon.jpeg')
                    : CachedNetworkImageProvider(imageUrl),
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                name,
                maxLine: 3,
                size: 15,
                fontWeight: FontWeight.w800,
                color: AppColor.orangeColor,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 3),
              textWidget(defaultCode, size: 13),
              const SizedBox(height: 1),
              textWidget("\$$price", size: 13, fontWeight: FontWeight.w800),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.minus_circle_fill,
                    color: AppColor.pinkColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  textWidget(qty),
                  const SizedBox(width: 10),
                  Icon(
                    CupertinoIcons.add_circled_solid,
                    color: AppColor.pinkColor,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
