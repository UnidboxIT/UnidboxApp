import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_detail_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/inventory_tracker/widgets/inventory_app_bar_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../widgets/stock_button_widget.dart';
import 'Inhouse_stock_widget.dart';
import 'product_detail_update.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productID;
  final String productName;
  const ProductDetailScreen(
      {super.key, required this.productID, required this.productName});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller = Get.find<ProductDetailController>();
      controller.productByID(productID);
      controller.inHouseStockByProductID(productID);
      superPrint(productID);
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              inventoryAppBarWidget(
                productName,
                () {
                  Get.back();
                },
                () {
                  Get.to(() => ProductDetailUpdateScreen(
                        productID: productID,
                      ));
                },
                Icons.edit_document,
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: productDetailBodyWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productDetailBodyWidget() {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Container(
        width: 100.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView(
          children: [
            productDetailWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stockButtonWidget(
                    () {
                      controller.toggleInHouseStockButton("In-house Stock");
                    },
                    "In-house Stock",
                    controller,
                  ),
                  stockButtonWidget(
                    () {
                      controller.toggleInHouseStockButton("Stock Ordering");
                    },
                    "Stock Ordering",
                    controller,
                  ),
                ],
              ),
            ),
            controller.stockName == "In-house Stock"
                ? inhouseStockWidget(controller)
                : const SizedBox()
          ],
        ),
      );
    });
  }

  Widget productDetailWidget() {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      String image = controller.productsDetail.imageUrl;
      String brand = controller.productsDetail.brand;
      String sku = controller.productsDetail.defaultCode;
      String barcode = controller.productsDetail.barcode;
      String model = controller.productsDetail.model;
      String retailPrice = controller.productsDetail.price.toString();
      String costPrice = controller.productsDetail.costPrice.toString();
      List attribueList = controller.productsDetail.attributeList;
      return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 25.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: image != "false"
                          ? NetworkImage(image)
                          : const NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo1xt3vxTKed2Dq6Qphc1IgbLU0LKwVVRg1-kxBwFeTg&s",
                            ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: eachProductWidget(
                    brand,
                    sku,
                    model,
                    attribueList,
                    barcode,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: priceWidget(
                retailPrice,
                costPrice,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget eachProductWidget(String brandValue, String skuValue,
      String modelValue, List attribute, String barcode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Brand",
                    fontWeight: FontWeight.bold,
                    size: 13,
                    color: AppColor.pinkColor),
                textWidget(brandValue, size: 13),
                const SizedBox(height: 8),
                textWidget("SKU",
                    fontWeight: FontWeight.bold,
                    size: 13,
                    color: AppColor.pinkColor),
                textWidget(skuValue, size: 13),
              ],
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget("Model",
                    fontWeight: FontWeight.bold,
                    size: 13,
                    color: AppColor.pinkColor),
                textWidget(modelValue, size: 13),
                const SizedBox(height: 8),
                textWidget("Barcode",
                    fontWeight: FontWeight.bold,
                    size: 13,
                    color: AppColor.pinkColor),
                textWidget(barcode, size: 13),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        textWidget("Attribute",
            fontWeight: FontWeight.bold, size: 13, color: AppColor.pinkColor),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: attribute
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, top: 4, bottom: 4, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: textWidget(e, size: 12),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }

  Widget priceWidget(String salePrice, String costPrice) {
    return Container(
      width: 100.w,
      height: 10.h,
      decoration: BoxDecoration(
          color: AppColor.bottomSheetBgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          eachPriceWidget("Retail Price", salePrice, DateTime.now().toString()),
          eachPriceWidget("Cost Price", costPrice, DateTime.now().toString())
        ],
      ),
    );
  }

  Widget eachPriceWidget(String name, String price, String date) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.money_dollar,
                color: AppColor.primary,
                size: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    name,
                    size: 12,
                    color: AppColor.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textWidget(price)
                ],
              )
            ],
          ),
          const Spacer(),
          textWidget(
              "Last updated ${DateFormat('d MMM yyyy').format(DateTime.now())}",
              size: 11,
              color: Colors.black.withOpacity(0.6))
        ],
      ),
    );
  }
}
