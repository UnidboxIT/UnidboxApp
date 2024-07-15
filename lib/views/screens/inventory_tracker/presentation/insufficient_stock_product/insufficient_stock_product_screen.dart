import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import '../../../../../back_up/home/create_product_screen.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../../../widgets/text_widget.dart';
import '../../repository/provider/product_provider.dart';
import '../../repository/state/insufficient_stock_state.dart';
import '../widgets/inventory_app_bar_widget copy.dart';
import '../widgets/search_text_field_widget.dart';

class InsufficientStockProductScreen extends ConsumerStatefulWidget {
  const InsufficientStockProductScreen({super.key});

  @override
  ConsumerState<InsufficientStockProductScreen> createState() =>
      _InsufficientStockProductScreenState();
}

class _InsufficientStockProductScreenState
    extends ConsumerState<InsufficientStockProductScreen> {
  List<Products> insufficientProductList = [];
  int pageNumber = 0;
  bool isLoading = false;
  bool xLoading = false;
  bool isDataExist = true;
  List<String> productIdList = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(insufficientStockStateNotifier.notifier).clearProductValue();
    scrollController.addListener(_scrollListener);
    loadProducts(0);
  }

  void loadProducts(pageNumber) {
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(insufficientStockStateNotifier.notifier)
          .insufficientStackProduct(pageNumber);
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
        pageNumber += 50;
        superPrint("HERE $pageNumber");
        loadProducts(pageNumber);
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          xLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(insufficientStockStateNotifier, (prev, next) {
      if (next is InsuffcientLoading) {
        setState(() {
          insufficientProductList = [];
          isLoading = true;
        });
      }
      if (next is ProductList) {
        setState(() {
          insufficientProductList = next.productList;
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
    return SuperScaffold(
        topColor: AppColor.primary,
        botColor: AppColor.bgColor,
        child: Scaffold(
          backgroundColor: AppColor.bgColor,
          body: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                inventoryAppBarWidget(
                  "Insufficient Stock",
                  () {
                    Navigator.of(context).pop();
                  },
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateProductScreen()));
                  },
                  Icons.add,
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: productWidget(context),
                ),
              ],
            ),
          ),
        ));
  }

  Widget productWidget(BuildContext context) {
    return Container(
      width: 100.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchTextFieldWidget(
            isInventoryTracker: true,
            isAutoFocus: false,
            name: "Inventory Tracker",
          ),
          Expanded(
              child: GridView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: insufficientProductList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    String name = insufficientProductList[index].name;
                    String image = insufficientProductList[index].imageUrl;
                    int qty = insufficientProductList[index].quantity.toInt();
                    double price = insufficientProductList[index].price;
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
                        child: eachProductWidget(image, name, qty, price),
                      ),
                    );
                  })),
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

  Widget eachProductWidget(
      String image, String fullName, int qty, double price) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 3.h),
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
            const SizedBox(height: 10),
            Container(
              height: 3.h,
              width: 100.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.red,
              ),
              alignment: Alignment.center,
              child: textWidget("Insufficient Stock",
                  color: Colors.white, size: 12.5, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: textWidget(fullName,
              maxLine: 4,
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
              textWidget("Qty : ${qty.toInt()}",
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  size: 12,
                  fontWeight: FontWeight.w500),
              textWidget("\$ ${CommonMethods.twoDecimalPrice(price)}",
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  size: 12,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
