import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/presentation/details/product_detail_screen.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../domain/product.dart';

class ScanProductWidget extends ConsumerStatefulWidget {
  final List<Products> productList;

  final bool isSearch;

  const ScanProductWidget({
    super.key,
    required this.productList,
    required this.isSearch,
  });

  @override
  ConsumerState<ScanProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ScanProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.productList.isEmpty
          ? Center(
              child: textWidget(
                widget.isSearch ? "Search your product" : "No Product",
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
              shrinkWrap: true,
              itemCount: widget.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 0,
                childAspectRatio: 0.93,
              ),
              itemBuilder: (context, index) {
                String productId = widget.productList[index].id.toString();
                String image = widget.productList[index].imageUrl;
                String name = widget.productList[index].name;
                double qty = widget.productList[index].quantity;
                double price = widget.productList[index].price;
                double qtyOutStock = widget.productList[index].qtyOutStock;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                              productID: productId,
                              productName: name,
                            )));
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  height: 14.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: image != "false"
                                          ? NetworkImage(image)
                                          : const NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo1xt3vxTKed2Dq6Qphc1IgbLU0LKwVVRg1-kxBwFeTg&s",
                                            ),
                                    ),
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
                                  color: qtyOutStock > 10
                                      ? AppColor.orangeColor
                                      : Colors.red,
                                ),
                                alignment: Alignment.center,
                                child: textWidget(
                                    qtyOutStock > 10
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
                                maxLine: 2,
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
                                textWidget("\$ $price",
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
      ],
    );
  }
}