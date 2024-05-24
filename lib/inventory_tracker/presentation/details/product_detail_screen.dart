import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/domain/inhouse_stock.dart';
import 'package:unidbox_app/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/inventory_tracker/presentation/details/Inhouse_stock_widget.dart';
import 'package:unidbox_app/inventory_tracker/presentation/details/stock_ordering_widget.dart';
import 'package:unidbox_app/inventory_tracker/presentation/widgets/inventory_app_bar_widget.dart';
import 'package:unidbox_app/inventory_tracker/presentation/widgets/stock_button_widget.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/stock_order_provider.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_detail_state.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/stock_ordering_state.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/stock_order.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../../repository/provider/product_detail_provider.dart';
import '../../repository/state/inhouse_stock_state.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productID;
  final String productName;
  const ProductDetailScreen(
      {super.key, required this.productID, required this.productName});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  Products productDetail = Products();
  List<InhouseStock> inHouseStockList = [];
  List<StockOrder> stockOrderList = [];
  bool isLoading = false;
  bool isInHouseLoading = false;
  String stockName = "In-house Stock";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(productDetailStateNotifierProvider.notifier)
          .productByID(widget.productID);
      ref
          .read(inhouseStockStateNotifierProvider.notifier)
          .getInHouseStock(int.parse(widget.productID));
      ref
          .read(stockOrderStateNotifierProvider.notifier)
          .getStockOrder(int.parse(widget.productID));
    });
  }

  void toggleInHouseStockButton(String name) {
    setState(() {
      stockName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(productDetailStateNotifierProvider, (prev, next) {
      if (next is ProductDetailLoading) {
        productDetail = Products();
        setState(() {
          isLoading = true;
        });
      }
      if (next is ProductDetail) {
        setState(() {
          productDetail = next.products;
          isLoading = false;
        });
      }
    });
    ref.listen(inhouseStockStateNotifierProvider, (prev, next) {
      if (next is InHouseLoading) {
        setState(() {
          isInHouseLoading = true;
        });
      }
      if (next is InhouseStockList) {
        setState(() {
          inHouseStockList = next.inhouseStock;
          isInHouseLoading = false;
        });
      }
    });

    ref.listen(stockOrderStateNotifierProvider, (pre, next) {
      if (next is StockOrderingLoading) {
        setState(() {
          stockOrderList = [];
        });
      }
      if (next is StockOrderingList) {
        stockOrderList = next.stockOrdering;
      }
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
                widget.productName,
                () {
                  Navigator.of(context).pop();
                },
                () {
                  // Get.to(() => ProductDetailUpdateScreen(
                  //       productID: productID,
                  //     ));
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
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: isLoading
          ? const SizedBox.shrink()
          : ListView(
              children: [
                productDetailWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stockButtonWidget(
                        () {
                          toggleInHouseStockButton("In-house Stock");
                        },
                        "In-house Stock",
                        stockName,
                      ),
                      stockButtonWidget(
                        () {
                          toggleInHouseStockButton("Stock Ordering");
                        },
                        "Stock Ordering",
                        stockName,
                      ),
                    ],
                  ),
                ),
                stockName == "In-house Stock"
                    ? isInHouseLoading
                        ? Container()
                        : InhouseStockWidget(
                            inHouseStockList: inHouseStockList,
                            productDetail: productDetail)
                    : StockOrderingWidget(stockOrderList: stockOrderList)
              ],
            ),
    );
  }

  Widget productDetailWidget() {
    String image = productDetail.imageUrl;
    String brand = productDetail.brand;
    String sku = productDetail.defaultCode;
    String barcode = productDetail.barcode;
    String model = productDetail.model;
    String retailPrice = productDetail.price.toString();
    String costPrice = productDetail.costPrice.toString();
    List attribueList = productDetail.attributeList;

    //controller.addRetailPriceCostPrice(retailPrice, costPrice);
    return isLoading
        ? const SizedBox.shrink()
        : Padding(
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
                        left: 8, top: 4, bottom: 4, right: 8),
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
            color: Colors.black.withOpacity(0.6),
          )
        ],
      ),
    );
  }
}
