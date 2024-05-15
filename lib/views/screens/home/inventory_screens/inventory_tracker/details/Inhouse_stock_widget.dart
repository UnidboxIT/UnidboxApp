import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_detail_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget inhouseStockWidget(ProductDetailController controller) {
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
                fontWeight: FontWeight.bold,
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
        controller.isInHouseLoading
            ? Container(
                height: 25.h,
                alignment: Alignment.center,
                child: CupertinoActivityIndicator(color: AppColor.primary),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String location =
                      controller.inhouseStockList[index].warehouseList[1];
                  String qty = controller.inhouseStockList[index].qty;
                  String id = controller
                      .inhouseStockList[index].warehouseList[0]
                      .toString();
                  return eachInhouseStockWidget(
                      location, qty.toString(), id, index);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: controller.inhouseStockList.length)
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
        child: index == 0 ? const SizedBox() : buttonWidget("Request", () {}),
      )
    ],
  );
}
