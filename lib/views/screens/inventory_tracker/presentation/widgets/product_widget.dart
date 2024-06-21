import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/details/product_detail_screen.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../domain/product.dart';
import '../../repository/state/product_state.dart';

class ProductWidget extends ConsumerStatefulWidget {
  final String id;
  final String name;

  const ProductWidget({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  ConsumerState<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  List<Products> productList = [];
  int pageNumber = 0;
  bool isLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(productStateNotifierProvider.notifier).clearProductValue();
    scrollController.addListener(_scrollListener);
    _loadProducts(0);
  }

  void _loadProducts(pageNumber) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(productStateNotifierProvider.notifier)
          .getAllProductsByCategoryID(widget.id, pageNumber);
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
        pageNumber += 20;
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
    ref.listen(productStateNotifierProvider, (prev, next) {
      if (next is Loading) {
        setState(() {
          productList = [];
          isLoading = true;
        });
      }
      if (next is ProductsList) {
        setState(() {
          productList = next.productList;
          if (next.productList.isEmpty) {
            isDataExist = false;
          }
          isLoading = false;
        });
      }

      if (next is IsDataExit) {
        setState(() {
          isDataExist = next.isExit;
        });
      }
    });

    return Expanded(
      child: isLoading
          ? Center(
              child: CupertinoActivityIndicator(
                color: AppColor.pinkColor,
              ),
            )
          : productList.isEmpty
              ? Center(
                  child: textWidget(
                    "No Product",
                    color: AppColor.fontColor,
                  ),
                )
              : productBodyWidget(),
    );
  }

  Widget productBodyWidget() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 0,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                String productId = productList[index].id.toString();
                String image = productList[index].imageUrl;
                String name = productList[index].name;
                double qty = productList[index].quantity;
                double price = productList[index].price;
                double qtyOutStock = productList[index].qtyOutStock;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                                  productID: productId,
                                  productName: name,
                                )))
                        .then((_) {
                      setState(() {
                        // final state = ref.read(productStateNotifierProvider);
                        // superPrint(state);
                        // if (state is ProductsList) {
                        //   productList = state.productList;
                        //   isLoading = false;
                        // }
                      });
                    });
                  },
                  child: Padding(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Container(
                                  height: 14.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
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
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: textWidget(name,
                                maxLine: 3,
                                textOverflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                size: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWidget("Qty : $qty",
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
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
