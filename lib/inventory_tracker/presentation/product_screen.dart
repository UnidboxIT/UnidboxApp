import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/presentation/widgets/product_widget.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../domain/product.dart';
import 'barcode_scanner/scan_product_widget.dart';
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
                  // Get.to(() => const CreateProductScreen());
                },
                Icons.add,
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: productBodyWidget(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productBodyWidget(BuildContext context, ref) {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          searchTextFieldWidget(context, ref),
          isScanBarCode
              ? ScanProductWidget(
                  productList: productList,
                  isSearch: false,
                )
              : ProductWidget(
                  id: parentID,
                  name: name,
                ),
        ],
      ),
    );
  }
}