import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/inventory_tracker/create_product_screen.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/inventory_tracker/widgets/product_widget.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import 'widgets/inventory_app_bar_widget.dart';
import 'widgets/search_text_field_widget.dart';

class ProductScreen extends StatelessWidget {
  final String parentID;
  final String name;
  const ProductScreen({super.key, required this.parentID, required this.name});

  @override
  Widget build(BuildContext context) {
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
                name,
                () {
                  Get.back();
                },
                () {
                  Get.to(() => const CreateProductScreen());
                },
                Icons.add,
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: productBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productBodyWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          searchTextFieldWidget(),
          ProductWidget(
            id: parentID,
            name: name,
          ),
        ],
      ),
    );
  }
}
