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
import '../../../../widgets/text_widget.dart';
import '../../domain/product.dart';
import '../barcode_scanner/barcode_scanner_screen.dart';
import '../create_product/create_product_screen.dart';
import '../details/product_detail_screen.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref
        .read(searchProductStateNotifierProvier.notifier)
        .clearSearchProductValue();
    scrollController.addListener(_scrollListener);
    _loadProducts(0);
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
    ref.listen(searchProductStateNotifierProvier, (prev, next) {
      if (next is Loading) {
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
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                inventoryAppBarWidget(
                  widget.name,
                  () {
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
    );
  }

  Widget searchBodyWidget(BuildContext context, WidgetRef ref) {
    return Container(
      width: 100.w,
      height: 82.h,
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
              height: 40,
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
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  suffixIcon: txtSearchProduct.text.isNotEmpty
                      ? TextButton(
                          onPressed: () async {
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
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const BarCodeScannerScreen()));
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
                                childAspectRatio: 0.9,
                              ),
                              itemBuilder: (context, index) {
                                String productId =
                                    productList[index].id.toString();
                                String image = productList[index].imageUrl;
                                String name = productList[index].name;
                                double qty = productList[index].quantity;
                                double price = productList[index].price;
                                double qtyOutStock =
                                    productList[index].qtyOutStock;
                                return GestureDetector(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailScreen(
                                                  productID: productId,
                                                  productName: name,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColor.dropshadowColor,
                                                blurRadius: 3,
                                                spreadRadius: 3),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                child: Container(
                                                  height: 14.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: image != "false"
                                                            ? NetworkImage(
                                                                image)
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
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: textWidget(name,
                                                maxLine: 2,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                size: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                textWidget("Qty : $qty",
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    size: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textWidget(
                                                    "\$ ${CommonMethods.twoDecimalPrice(price)}",
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    size: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10)
                                        ],
                                      ),
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
