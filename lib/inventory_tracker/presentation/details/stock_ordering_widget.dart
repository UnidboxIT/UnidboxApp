import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../domain/inhouse_stock.dart';

Widget stockOrderingWidget(List<InhouseStock> inHouseStockList) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: textWidget(
                "Vendor",
                fontWeight: FontWeight.bold,
                color: AppColor.orangeColor,
                size: 14,
              ),
            ),
            Expanded(
              flex: 3,
              child: textWidget(
                "Cost",
                color: AppColor.orangeColor,
                size: 14,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            )
          ],
        ),
        const SizedBox(height: 10),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String location = inHouseStockList[index].warehouseList[1];
              String qty = inHouseStockList[index].qty;
              String id = inHouseStockList[index].warehouseList[0].toString();

              return eachInhouseStockWidget(
                  location, qty.toString(), id, index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: inHouseStockList.length)
      ],
    ),
  );
}

Widget eachInhouseStockWidget(
    String location, String qty, String id, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
        child: textWidget(location,
            color: Colors.black, size: 14, textAlign: TextAlign.left),
      ),
      Expanded(
        flex: 3,
        child: textWidget(qty,
            color: Colors.black, size: 14, textAlign: TextAlign.center),
      ),
      const SizedBox(width: 10),
      Expanded(
        flex: 4,
        child: buttonWidget("Add To Cart", () {}),
      )
    ],
  );
}
