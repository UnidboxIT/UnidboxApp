import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../utils/commons/super_scaffold.dart';
import '../../../utils/constant/app_color.dart';
import '../../domain/product.dart';
import '../barcode_scanner/scan_product_widget.dart';
import '../widgets/inventory_app_bar_widget.dart';
import '../widgets/search_text_field_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    ref.listen(productStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        productList = [];
      }
      if (next is ProductsList) {
        setState(() {
          productList = next.productList;
          superPrint(productList);
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
            FocusManager.instance.primaryFocus!.unfocus();
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
                    FocusManager.instance.primaryFocus!.unfocus();
                    Navigator.of(context).pop();
                  },
                  () {
                    //  Get.to(() => const CreateProductScreen());
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

  Widget searchBodyWidget(BuildContext context, ref) {
    return Container(
      width: 100.w,
      height: 82.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          searchTextFieldWidget(context, ref, isAutoFocus: true),
          ScanProductWidget(
            productList: productList,
            isSearch: true,
          )
        ],
      ),
    );
  }
}
