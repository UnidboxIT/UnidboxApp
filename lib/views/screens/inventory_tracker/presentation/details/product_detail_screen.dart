import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/inhouse_stock.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/details/Inhouse_stock_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/details/stock_ordering_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/inventory_app_bar_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/stock_button_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/stock_order_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/product_detail_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_ordering_state.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../user_warehouse_service/domain/user_warehouse.dart';
import '../../../../user_warehouse_service/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse_service/state/user_warehouse_state.dart';
import '../../domain/stock_order.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../../repository/provider/product_detail_provider.dart';
import '../../repository/state/inhouse_stock_state.dart';
import '../update_product/product_detail_update.dart';
import 'check_out_order_detail_screen.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productID;
  final String productName;
  final bool isInternalTransfer;
  const ProductDetailScreen(
      {super.key,
      required this.productID,
      required this.productName,
      required this.isInternalTransfer});

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
  Map<int, int> totalQty = {};
  List<Map<String, dynamic>> orderLineList = [];
  Map<String, Map<String, dynamic>> checkOutDataMap = {};
  bool isWarehouseLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(productDetailStateNotifierProvider.notifier)
          .productByID(widget.productID);
      if (!widget.isInternalTransfer) {
        ref
            .read(inhouseStockStateNotifierProvider.notifier)
            .getInHouseStock(int.parse(widget.productID));
        ref
            .read(stockOrderStateNotifierProvider.notifier)
            .getStockOrder(int.parse(widget.productID));
      }
    });
  }

  void toggleInHouseStockButton(String name) {
    setState(() {
      stockName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userWarehouseStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          isWarehouseLoading = true;
        });
      }
      if (next is UserWarehouseData) {
        setState(() {
          userWarehouse = next.warehouse;
          isWarehouseLoading = false;
        });
      }
    });
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
      if (next is IncrementStockOrderQty) {
        setState(() {
          totalQty = next.qty;
        });
      }
      if (next is DecrementStockOrderQty) {
        setState(() {
          totalQty = next.qty;
        });
      }

      if (next is OrderLines) {
        setState(() {
          orderLineList = next.orderLine;
        });
      }

      if (next is CheckOutMap) {
        setState(() {
          checkOutDataMap = next.checkoutMap;
        });
      }
      if (next is ClearTotalQty) {
        setState(() {
          totalQty = next.totalQty;
        });
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
              inventoryAppBarWidget(widget.productName, () {
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => ProductDetailUpdateScreen(
                              productID: widget.productID,
                              rackIdList: productDetail.rackIdList,
                              retailPrice: CommonMethods.twoDecimalPrice(
                                  productDetail.price),
                              costPrice: CommonMethods.threeDecimalPrice(
                                  productDetail.costPrice),
                            )))
                    .then((_) {
                  ref
                      .read(productDetailStateNotifierProvider.notifier)
                      .productByID(widget.productID);
                  final state = ref.read(productDetailStateNotifierProvider);
                  if (state is ProductDetail) {
                    setState(() {
                      productDetail = state.products;
                    });
                  }
                  superPrint("Here");
                  superPrint(productDetail.rackIdList);
                });
              }, Icons.edit_document,
                  isInternalTransfer: !widget.isInternalTransfer),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: productDetailBodyWidget(),
              ),
              Positioned(
                bottom: 0,
                child: stockName == "In-house Stock"
                    ? const SizedBox.shrink()
                    : totalQty.isEmpty || totalQty.values.contains(0)
                        ? const SizedBox.shrink()
                        : Container(
                            width: 100.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                for (var data in totalQty.values)
                                  textWidget(data.toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      size: 16),
                                const SizedBox(width: 5),
                                textWidget("Items",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    size: 16),
                                const Spacer(),
                                buttonWidget("Check Out", () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CheckOutOrderDetailScreen(
                                          orderLine: orderLineList,
                                          checkOutDataMap: checkOutDataMap),
                                    ),
                                  );
                                }),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
              ),
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
                Visibility(
                  visible: !widget.isInternalTransfer,
                  child: Padding(
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
                ),
                Visibility(
                  visible: !widget.isInternalTransfer,
                  child: stockName == "In-house Stock"
                      ? InhouseStockWidget(
                          inHouseStockList: inHouseStockList,
                          productDetail: productDetail,
                          userWarehouse: userWarehouse,
                        )
                      : StockOrderingWidget(
                          stockOrderList: stockOrderList,
                          productDetail: productDetail),
                )
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
                SizedBox(
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.dropshadowColor,
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ],
                          image: DecorationImage(
                            image: image != "false"
                                ? NetworkImage(image)
                                : const AssetImage(
                                    "assets/images/app_icon.jpeg",
                                  ),
                            fit: BoxFit.contain,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Brand",
                      fontWeight: FontWeight.bold,
                      size: 13,
                      color: AppColor.pinkColor),
                  textWidget(brandValue == "false" ? "" : brandValue, size: 13),
                  const SizedBox(height: 8),
                  textWidget("SKU",
                      fontWeight: FontWeight.bold,
                      size: 13,
                      color: AppColor.pinkColor),
                  textWidget(skuValue == "false" ? "" : skuValue, size: 13),
                ],
              ),
            ),
            SizedBox(
              width: 25.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Model",
                      fontWeight: FontWeight.bold,
                      size: 13,
                      color: AppColor.pinkColor),
                  textWidget(modelValue == "false" ? "" : "modelValue",
                      size: 13),
                  const SizedBox(height: 8),
                  textWidget("Barcode",
                      fontWeight: FontWeight.bold,
                      size: 13,
                      color: AppColor.pinkColor),
                  textWidget(barcode == "false" ? "" : barcode, size: 13),
                ],
              ),
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

  Widget priceWidget(
    String salePrice,
    String costPrice,
  ) {
    return Container(
      width: 100.w,
      height: 10.h,
      decoration: BoxDecoration(
          color: AppColor.bottomSheetBgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColor.dropshadowColor,
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          eachPriceWidget(
              "Retail Price",
              CommonMethods.twoDecimalPrice(double.parse(salePrice)),
              DateTime.now().toString()),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerRight,
            children: [
              eachPriceWidget(
                "Cost Price",
                CommonMethods.threeDecimalPrice(double.parse(costPrice)),
                DateTime.now().toString(),
              ),
              Positioned(
                right: -15,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      width: 45.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.dropshadowColor,
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: const Offset(0, 3)),
                        ],
                      ),
                      child: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
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
