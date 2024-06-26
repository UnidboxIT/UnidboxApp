import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/product_widget.dart';
import '../../../../../../../utils/commons/super_scaffold.dart';
import '../../../../../../../utils/constant/app_color.dart';
import '../domain/product.dart';
import 'create_product/create_product_screen.dart';
import 'widgets/inventory_app_bar_widget.dart';
import 'widgets/search_text_field_widget.dart';

class ProductScreen extends ConsumerWidget {
  final String parentID;
  final String name;
  final bool isScanBarCode;
  final List<Products> productList;
  const ProductScreen({
    super.key,
    required this.parentID,
    required this.name,
    required this.isScanBarCode,
    required this.productList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          SearchTextFieldWidget(
            isAutoFocus: false,
            isInventoryTracker: false,
            name: name,
          ),
          ProductWidget(
            id: parentID,
            name: name,
          ),
          Container(
            height: 8.h,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
