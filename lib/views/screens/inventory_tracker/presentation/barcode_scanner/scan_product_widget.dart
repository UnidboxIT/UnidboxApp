import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/details/product_detail_screen.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/scan_product_state.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../domain/product.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../create_product/create_product_screen.dart';
import '../details/Inhouse_stock_widget.dart';
import '../widgets/each_product_list_request_widget.dart';
import '../widgets/insufficient_request_bottom_sheet.dart';
import '../widgets/inventory_app_bar_widget.dart';
import '../widgets/search_text_field_widget.dart';

class ScanProductScreen extends ConsumerStatefulWidget {
  final String barcode;
  final List<Products> scanProductList;

  const ScanProductScreen(
      {super.key, required this.barcode, required this.scanProductList});

  @override
  ConsumerState<ScanProductScreen> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ScanProductScreen> {
  List<Products> productList = [];
  int pageNumber = 0;
  bool isLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  bool isSearching = false;
  ScrollController scrollController = ScrollController();
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;
  List<String> productIdList = [];

  @override
  void initState() {
    super.initState();
    // superPrint(productList);
    // ref.read(scanProductStateNotifierProvier.notifier).clearScanProduct();
    scrollController.addListener(_scrollListener);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
    //_loadProducts(0);
  }

  void _loadProducts(pageNumber) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(scanProductStateNotifierProvier.notifier)
          .scanProductByBarCodePagination(widget.barcode, context, pageNumber);
    });
  }

  void _scrollListener() async {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        !xLoading) {
      if (isDataExist) {
        setState(() {
          xLoading = true;
        });
        pageNumber += 10;
        superPrint("HERE $pageNumber");
        _loadProducts(pageNumber);
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          xLoading = false;
        });
      }
    }
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
    final state = ref.read(scanProductStateNotifierProvier);
    if (state is ScanProductList) {
      productList = state.scanProductList;
    }
    ref.listen(scanProductStateNotifierProvier, (prev, next) {
      if (next is ScanProductLoading) {
        setState(() {
          productList = [];
          isLoading = true;
        });
      }
      if (next is ScanProductList) {
        setState(() {
          productList = next.scanProductList;
          if (next.scanProductList.isEmpty) {
            isDataExist = false;
          }
          isLoading = false;
        });
        superPrint(productList);
      }

      if (next is IsScanDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              inventoryAppBarWidget(
                  productList.isEmpty
                      ? ""
                      : productList.first.categoryIdList[1], () {
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateProductScreen()));
              }, Icons.add, isInternalTransfer: false),
              Transform.translate(
                  offset: Offset(0, 14.h), child: scanBodyWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget scanBodyWidget() {
    return Container(
      width: 100.w,
      height: 82.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          SearchTextFieldWidget(
            isAutoFocus: false,
            isInventoryTracker: false,
            name:
                productList.isEmpty ? "" : productList.first.categoryIdList[1],
          ),
          Expanded(
            child: productList.isEmpty
                ? Center(
                    child: textWidget(
                      "No Product",
                      color: AppColor.fontColor,
                    ),
                  )
                : productBodyWidget(),
          ),
          if (xLoading)
            SizedBox(
              height: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: AppColor.bgColor,
                    borderRadius: BorderRadius.circular(4)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget("Loadmore ...",
                        color: AppColor.pinkColor,
                        fontWeight: FontWeight.bold,
                        size: 15),
                    CupertinoActivityIndicator(color: AppColor.pinkColor),
                  ],
                ),
              ),
            ),
          Platform.isIOS && xLoading
              ? SizedBox(height: 3.h)
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget productBodyWidget() {
    return GridView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 0,
          childAspectRatio: 0.64,
        ),
        itemBuilder: (context, index) {
          String productId = productList[index].id.toString();
          String image = productList[index].imageUrl;
          String name = productList[index].name;
          String fullName = productList[index].fullName;
          double qty = productList[index].quantity;
          double price = productList[index].price;
          double qtyOutStock = productList[index].qtyOutStock;
          superPrint(qty);
          superPrint(qtyOutStock);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.dropshadowColor,
                        blurRadius: 3,
                        spreadRadius: 3),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productIdList.contains(productId)
                      ? EachProductListRequestWidget(
                          product: productList[index],
                          productIdList: productIdList,
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                productID: productId,
                                                productName: fullName,
                                                isInternalTransfer: false,
                                              )));
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 3.h),
                                      child: Container(
                                        height: 14.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: image != "false"
                                                  ? NetworkImage(image)
                                                  : const AssetImage(
                                                      "assets/images/app_icon.jpeg",
                                                    )),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        color: qty > qtyOutStock
                                            ? AppColor.orangeColor
                                            : Colors.red,
                                      ),
                                      alignment: Alignment.center,
                                      child: textWidget(
                                          qty > qtyOutStock
                                              ? "Sufficient Stock"
                                              : "Insufficient Stock",
                                          color: Colors.white,
                                          size: 12.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                productID: productId,
                                                productName: fullName,
                                                isInternalTransfer: false,
                                              )));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: textWidget(name,
                                      maxLine: 4,
                                      textOverflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      size: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textWidget("Qty : ${qty.toInt()}",
                                        textOverflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        size: 12,
                                        fontWeight: FontWeight.w500),
                                    textWidget(
                                        "\$ ${CommonMethods.twoDecimalPrice(price)}",
                                        textOverflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        size: 12,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                  const SizedBox(height: 5),
                  productIdList.contains(productId)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            requestButtonWidgetInProductList("Cancel", () {
                              superPrint(productIdList);
                              if (productIdList.contains(productId)) {
                                setState(() {
                                  productIdList.remove(productId);
                                });
                              }
                            },
                                elevation: 0.2,
                                fontSize: 15,
                                bgColor: Colors.grey.shade100,
                                fontColor: AppColor.primary),
                            requestButtonWidgetInProductList("Send", () {
                              FocusManager.instance.primaryFocus!.unfocus();
                              superPrint(
                                  productList[index].defaultWarehouseQty);
                              if (productList[index]
                                  .defaultWarehouseList
                                  .isEmpty) {
                                ref
                                    .read(inhouseStockStateNotifierProvider
                                        .notifier)
                                    .getInHouseStock(
                                        productList[index].id, context);

                                showInsuffiecientBottomSheet(
                                  productList[index].id.toString(),
                                  context,
                                  productList[index],
                                  userWarehouse,
                                  "Default warehouse is not set.",
                                );
                              } else if (productList[index]
                                      .defaultWarehouseQty <
                                  qtyByMap[productList[index].id.toString()]!) {
                                ref
                                    .read(inhouseStockStateNotifierProvider
                                        .notifier)
                                    .getInHouseStock(
                                        productList[index].id, context);

                                showInsuffiecientBottomSheet(
                                  productList[index].id.toString(),
                                  context,
                                  productList[index],
                                  userWarehouse,
                                  productList[index].defaultWarehouseList[1] +
                                      "have insufficient quantity\n for your request.",
                                );
                              } else {
                                isSendRequestLoading
                                    ? () {}
                                    : ref
                                        .read(stockRequesstStateNotifierProvider
                                            .notifier)
                                        .requestInHouseStock(
                                          userWarehouse.warehouseList[0],
                                          productList[index]
                                              .defaultWarehouseList[0],
                                          admin.companyId,
                                          productList[index].id,
                                          productList[index].name,
                                          qtyByMap[productList[index]
                                              .id
                                              .toString()]!,
                                          productList[index].price,
                                          selectedBox,
                                          isUrgentMap[productList[index]
                                                  .id
                                                  .toString()] ??
                                              false,
                                          context,
                                        )
                                        .then((_) {
                                        ref
                                            .read(
                                                inhouseStockStateNotifierProvider
                                                    .notifier)
                                            .getInHouseStock(
                                                productList[index].id, context);
                                      });
                              }
                            },
                                isBool: isSendRequestLoading,
                                fontSize: 15,
                                elevation: 0.2,
                                bgColor: Colors.grey.shade100,
                                fontColor: AppColor.primary),
                          ],
                        )
                      : Center(
                          child: SizedBox(
                              width: 40.w,
                              height: 35,
                              child: buttonWidget(
                                "Request",
                                () {
                                  if (!productIdList.contains(productId)) {
                                    setState(() {
                                      productIdList.add(productId);
                                    });
                                  }

                                  superPrint(productIdList);
                                },
                                elevation: 0.2,
                                bgColor: Colors.grey.shade100,
                              )),
                        ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
