import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../domain/my_request.dart';

Widget eachMyRequestWidget(
  String requestCode,
  String urgent,
  String name,
  String requestFrom,
  String status,
  List<ProductLineId> productLis,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              requestCode,
              fontWeight: FontWeight.bold,
              size: 25,
            ),
            textWidget(urgent.toUpperCase(),
                color: AppColor.pinkColor,
                fontWeight: FontWeight.bold,
                size: 25)
          ],
        )
      ],
    ),
  );
}
