import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget inhouseStockWidget() {
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
                "Location",
                color: AppColor.orangeColor,
                size: 14,
              ),
            ),
            Expanded(
              flex: 3,
              child: textWidget(
                "Quantity",
                color: AppColor.orangeColor,
                size: 14,
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
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String location = "Kapo";
              String qty = "1";
              String id = index.toString();
              return eachInhouseStockWidget(location, qty, id);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: 10)
      ],
    ),
  );
}

Widget eachInhouseStockWidget(String location, String qty, String id) {
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
        child: buttonWidget("Request", () {}),
      )
    ],
  );
}
