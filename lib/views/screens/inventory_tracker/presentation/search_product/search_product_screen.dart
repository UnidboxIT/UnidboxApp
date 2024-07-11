import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/search_product_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../domain/product.dart';
import '../../repository/provider/inhouse_stock_provider.dart';
import '../barcode_scanner/barcode_scanner_screen.dart';
import '../create_product/create_product_screen.dart';
import '../details/Inhouse_stock_widget.dart';
import '../details/product_detail_screen.dart';
import '../widgets/each_product_list_request_widget.dart';
import '../widgets/insufficient_request_bottom_sheet.dart';
import '../widgets/inventory_app_bar_widget.dart';

TextEditingController txtSearchProduct = TextEditingController();

class SearchProductScreen extends ConsumerStatefulWidget {
  final String name;
  const SearchProductScreen({super.key, required this.name});

  @override
  ConsumerState<SearchProductScreen> createState() =>
      _SearchProductScreenState();
}

class _SearchProductScreenState extends ConsumerState<SearchProductScreen> {
  List<Products> productList = [];
  int pageNumber = 0;
  bool isLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  bool isSearching = false;
  bool isClickSearchButton = false;
  ScrollController scrollController = ScrollController();
  List<String> productIdList = [];
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref
        .read(searchProductStateNotifierProvier.notifier)
        .clearSearchProductValue();
    scrollController.addListener(_scrollListener);
    _loadProducts(0);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(userWarehouseStateNotifierProvider.notifier).getUserWarehouse();
    });
  }

  void _loadProducts(pageNumber) {
    superPrint("HERE");
    if (txtSearchProduct.text.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 10), () {
        superPrint(txtSearchProduct.text);
        ref
            .read(searchProductStateNotifierProvier.notifier)
            .searchProduct(txtSearchProduct.text, context, pageNumber);
      });
    }
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
    ref.listen(searchProductStateNotifierProvier, (prev, next) {
      if (next is SearchProductLoading) {
        setState(() {
          productList = [];
          isLoading = true;
        });
      }
      if (next is SearchProductList) {
        setState(() {
          productList = next.searchProductList;
          if (next.searchProductList.isEmpty) {
            isDataExist = false;
          }
          isLoading = false;
        });
        // superPrint(productList);
      }

      if (next is IsSearchDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: PopScope(
          onPopInvoked: (_) async {
            txtSearchProduct.clear();
            FocusManager.instance.primaryFocus!.unfocus();
            Future.delayed(const Duration(milliseconds: 100));
            return;
          },
          child: PopScope(
            onPopInvoked: (didPop) =>
                ref.read(bottomBarVisibilityProvider.notifier).state = true,
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  inventoryAppBarWidget(
                    widget.name,
                    () {
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          true;
                      txtSearchProduct.clear();
                      FocusManager.instance.primaryFocus!.unfocus();
                      Future.delayed(const Duration(milliseconds: 100));
                      Navigator.of(context).pop();
                    },
                    () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateProductScreen()));
                    },
                    Icons.add,
                  ),
                  Transform.translate(
                      offset: Offset(0, 14.h),
                      child: searchBodyWidget(context, ref)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBodyWidget(BuildContext context, WidgetRef ref) {
    return Container(
      width: 100.w,
      height: Platform.isIOS ? 70.h : 71.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          //search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              // height: 10.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                autofocus: true,
                textAlign: TextAlign.left,
                controller: txtSearchProduct,
                cursorColor: Colors.grey,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textInputAction: TextInputAction.search,
                onChanged: (value) async {
                  setState(() {
                    txtSearchProduct.text = value;
                  });

                  if (value.isEmpty) {
                    setState(() {
                      isClickSearchButton = false;
                    });

                    pageNumber = 0;
                    isLoading = false;
                    xLoading = false;
                    isDataExist = true;
                    ref
                        .read(searchProductStateNotifierProvier.notifier)
                        .clearSearchProductValue();
                    Future.delayed(const Duration(milliseconds: 10), () {
                      ref
                          .read(searchProductStateNotifierProvier.notifier)
                          .searchProduct("", context, pageNumber);
                    });
                  }
                },
                onEditingComplete: () async {
                  FocusManager.instance.primaryFocus!.unfocus();
                  setState(() {
                    isClickSearchButton = true;
                  });
                  pageNumber = 0;
                  isLoading = false;
                  xLoading = false;
                  isDataExist = true;
                  ref
                      .read(searchProductStateNotifierProvier.notifier)
                      .clearSearchProductValue();
                  ref
                      .read(searchProductStateNotifierProvier.notifier)
                      .searchProduct(txtSearchProduct.text, context, 0);
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  suffixIcon: txtSearchProduct.text.isNotEmpty
                      ? TextButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus!.unfocus();
                            setState(() {
                              isClickSearchButton = true;
                            });
                            pageNumber = 0;
                            isLoading = false;
                            xLoading = false;
                            isDataExist = true;
                            ref
                                .read(
                                    searchProductStateNotifierProvier.notifier)
                                .clearSearchProductValue();
                            ref
                                .read(
                                    searchProductStateNotifierProvier.notifier)
                                .searchProduct(
                                    txtSearchProduct.text, context, 0);
                          },
                          child: textWidget(
                            "Search",
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            size: 15,
                          ))
                      : IconButton(
                          icon: const Icon(
                            CupertinoIcons.qrcode_viewfinder,
                            size: 18,
                          ),
                          onPressed: () {
                            txtSearchProduct.clear();
                            ref
                                .read(bottomBarVisibilityProvider.notifier)
                                .state = false;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const BarCodeScannerScreen()));
                          },
                        ),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    size: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          isLoading
              ? Container(
                  height: 50.h,
                  alignment: Alignment.center,
                  child: CupertinoActivityIndicator(
                    color: AppColor.pinkColor,
                  ),
                )
              : txtSearchProduct.text.isEmpty || !isClickSearchButton
                  ? Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      child: textWidget(
                        "Search your product",
                        color: AppColor.fontColor,
                      ),
                    )
                  : isClickSearchButton && productList.isEmpty
                      ? Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          child: textWidget(
                            "No Product Found!",
                            color: AppColor.fontColor,
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: productList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 0,
                                childAspectRatio: 0.64,
                              ),
                              itemBuilder: (context, index) {
                                String productId =
                                    productList[index].id.toString();
                                String image = productList[index].imageUrl;
                                String name = productList[index].name;
                                String fullName = productList[index].fullName;
                                double qty = productList[index].quantity;
                                double price = productList[index].price;
                                double qtyOutStock =
                                    productList[index].qtyOutStock;
                                superPrint(productList[index].uomList);
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        ref
                                                            .read(
                                                                bottomBarVisibilityProvider
                                                                    .notifier)
                                                            .state = false;
                                                        FocusManager.instance
                                                            .primaryFocus!
                                                            .unfocus();
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    false)
                                                            .push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ProductDetailScreen(
                                                                              productID: productId,
                                                                              productName: fullName,
                                                                              isInternalTransfer: false,
                                                                            )));
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 8,
                                                                    right: 8,
                                                                    top: 3.h),
                                                            child: Container(
                                                              height: 14.h,
                                                              width: 100.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius: const BorderRadius
                                                                    .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10)),
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
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15),
                                                              ),
                                                              color: qty >
                                                                      qtyOutStock
                                                                  ? AppColor
                                                                      .orangeColor
                                                                  : Colors.red,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: textWidget(
                                                                qty > qtyOutStock
                                                                    ? "Sufficient Stock"
                                                                    : "Insufficient Stock",
                                                                color: Colors
                                                                    .white,
                                                                size: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        ref
                                                            .read(
                                                                bottomBarVisibilityProvider
                                                                    .notifier)
                                                            .state = false;
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    false)
                                                            .push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ProductDetailScreen(
                                                                              productID: productId,
                                                                              productName: fullName,
                                                                              isInternalTransfer: false,
                                                                            )));
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: textWidget(name,
                                                            maxLine: 4,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          textWidget(
                                                              "Qty : ${qty.toInt()}",
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textWidget(
                                                              "\$ ${CommonMethods.twoDecimalPrice(price)}",
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                  ],
                                                ),
                                              ),
                                        productIdList.contains(productId)
                                            ? const Spacer()
                                            : const SizedBox(height: 5),
                                        productIdList.contains(productId)
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  requestButtonWidgetInProductList(
                                                      "Cancel", () {
                                                    superPrint(productIdList);
                                                    if (productIdList
                                                        .contains(productId)) {
                                                      setState(() {
                                                        productIdList
                                                            .remove(productId);
                                                      });
                                                    }
                                                  },
                                                      elevation: 0.2,
                                                      fontSize: 15,
                                                      bgColor:
                                                          Colors.grey.shade100,
                                                      fontColor:
                                                          AppColor.primary),
                                                  requestButtonWidgetInProductList(
                                                      "Send", () {
                                                    ref
                                                        .read(
                                                            bottomBarVisibilityProvider
                                                                .notifier)
                                                        .state = false;
                                                    FocusManager
                                                        .instance.primaryFocus!
                                                        .unfocus();

                                                    if (productList[index]
                                                        .defaultWarehouseList
                                                        .isEmpty) {
                                                      superPrint("HERE");
                                                      ref
                                                          .read(
                                                              inhouseStockStateNotifierProvider
                                                                  .notifier)
                                                          .getInHouseStock(
                                                              productList[index]
                                                                  .id,
                                                              context)
                                                          .then((_) {});

                                                      showInsuffiecientBottomSheet(
                                                        productList[index]
                                                            .id
                                                            .toString(),
                                                        context,
                                                        productList[index],
                                                        userWarehouse,
                                                        "Default warehouse is not set.",
                                                      ).then((_) {
                                                        ref
                                                            .read(
                                                                bottomBarVisibilityProvider
                                                                    .notifier)
                                                            .state = true;
                                                      });
                                                    } else if (productList[
                                                                    index]
                                                                .defaultWarehouseQty <
                                                            qtyByMap[productList[
                                                                    index]
                                                                .id
                                                                .toString()]! ||
                                                        productList[index]
                                                                    .defaultWarehouseList[
                                                                0] ==
                                                            userWarehouse
                                                                    .warehouseList[
                                                                0]) {
                                                      ref
                                                          .read(
                                                              inhouseStockStateNotifierProvider
                                                                  .notifier)
                                                          .getInHouseStock(
                                                              productList[index]
                                                                  .id,
                                                              context)
                                                          .then((_) {});

                                                      showInsuffiecientBottomSheet(
                                                        productList[index]
                                                            .id
                                                            .toString(),
                                                        context,
                                                        productList[index],
                                                        userWarehouse,
                                                        productList[index]
                                                                .defaultWarehouseList[1] +
                                                            "have insufficient quantity\n for your request.",
                                                      ).then((_) {
                                                        ref
                                                            .read(
                                                                bottomBarVisibilityProvider
                                                                    .notifier)
                                                            .state = true;
                                                      });
                                                    } else {
                                                      isSendRequestLoading
                                                          ? () {}
                                                          : ref
                                                              .read(
                                                                  stockRequesstStateNotifierProvider
                                                                      .notifier)
                                                              .requestInHouseStock(
                                                                userWarehouse
                                                                    .warehouseList[0],
                                                                productList[
                                                                        index]
                                                                    .defaultWarehouseList[0],
                                                                admin.companyId,
                                                                productList[
                                                                        index]
                                                                    .id,
                                                                productList[
                                                                        index]
                                                                    .name,
                                                                qtyByMap[productList[
                                                                        index]
                                                                    .id
                                                                    .toString()]!,
                                                                productList[
                                                                        index]
                                                                    .price,
                                                                selectedBox,
                                                                isUrgentMap[productList[
                                                                            index]
                                                                        .id
                                                                        .toString()] ??
                                                                    false,
                                                                context,
                                                                ref,
                                                              )
                                                              .then((_) {
                                                              ref
                                                                  .read(inhouseStockStateNotifierProvider
                                                                      .notifier)
                                                                  .getInHouseStock(
                                                                      productList[
                                                                              index]
                                                                          .id,
                                                                      context);
                                                              ref
                                                                  .read(bottomBarVisibilityProvider
                                                                      .notifier)
                                                                  .state = true;
                                                            });
                                                    }
                                                  },
                                                      isBool:
                                                          isSendRequestLoading,
                                                      fontSize: 15,
                                                      elevation: 0.2,
                                                      bgColor:
                                                          Colors.grey.shade100,
                                                      fontColor:
                                                          AppColor.primary),
                                                ],
                                              )
                                            : Center(
                                                child: SizedBox(
                                                    width: 40.w,
                                                    height: 35,
                                                    child: buttonWidget(
                                                      "Request",
                                                      () {
                                                        if (!productIdList
                                                            .contains(
                                                                productId)) {
                                                          setState(() {
                                                            productIdList
                                                                .add(productId);
                                                          });
                                                        }

                                                        superPrint(
                                                            productIdList);
                                                      },
                                                      elevation: 0.2,
                                                      bgColor:
                                                          Colors.grey.shade100,
                                                    )),
                                              ),
                                        const SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                );
                              }),
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
