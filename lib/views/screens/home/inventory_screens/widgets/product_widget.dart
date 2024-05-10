import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class ProductWidget extends StatelessWidget {
  final String id;
  final String name;
  const ProductWidget({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductController>().getAllProductsByCategoryID(id);
    });

    return Expanded(
      child: productBodyWidget(),
    );
  }

  Widget productBodyWidget() {
    return GetBuilder<ProductController>(builder: (controller) {
      if (controller.isProductLoading) {
        return Center(
          child: CupertinoActivityIndicator(
            color: AppColor.primary,
          ),
        );
      }
      if (controller.searchProductsList.isEmpty) {
        return Center(
          child: textWidget(
            "No Product",
            color: AppColor.fontColor,
          ),
        );
      }
      return GridView.builder(
          shrinkWrap: true,
          itemCount: controller.searchProductsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0,
            childAspectRatio: 0.93,
          ),
          itemBuilder: (context, index) {
            // String image = controller.searchProductsList[index].
            String name = controller.searchProductsList[index].name;
            double qty = controller.searchProductsList[index].quantity;
            double price = controller.searchProductsList[index].price;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 14.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                              // image: const DecorationImage(
                              //   image: NetworkImage(""),
                              // ),
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
                            color: AppColor.orangeColor,
                          ),
                          alignment: Alignment.center,
                          child: textWidget("Sufficient Stock",
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
                          textWidget("\$ : $price",
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
            );
          });
    });
  }
}
