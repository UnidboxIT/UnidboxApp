import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/product_screen.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/product_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import '../domain/inventory_tracker.dart';
import 'create_product/create_product_screen.dart';
import 'widgets/each_inventory_tracker_widget.dart';
import 'widgets/each_product_list_request_widget.dart';
import 'widgets/inventory_app_bar_widget.dart';
import 'widgets/search_text_field_widget.dart';

class InventoryTrackerSubCategoryScreen extends ConsumerStatefulWidget {
  final String parentID;
  final String name;
  final List<InventoryTracker> inventoryTrackerList;
  const InventoryTrackerSubCategoryScreen(
      {super.key,
      required this.parentID,
      required this.name,
      required this.inventoryTrackerList});

  @override
  ConsumerState<InventoryTrackerSubCategoryScreen> createState() =>
      _InventoryCategoryScreenState();
}

class _InventoryCategoryScreenState
    extends ConsumerState<InventoryTrackerSubCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qtyByMap = {};
    isUrgentMap = {};
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Container(
          width: 100.w,
          height: 100.h,
          color: AppColor.bgColor,
          child: Stack(
            children: [
              inventoryAppBarWidget(widget.name, () {
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateProductScreen()));
              }, Icons.add, isInternalTransfer: false),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: subCategoryBodyWidget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subCategoryBodyWidget(BuildContext context) {
    return Container(
      width: 100.w,
      height: widget.inventoryTrackerList.isEmpty ? 86.h : 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SearchTextFieldWidget(
              isInventoryTracker:
                  widget.inventoryTrackerList.isEmpty ? false : true,
              isAutoFocus: false,
              name: widget.name),
          widget.inventoryTrackerList.isEmpty
              ? ProductWidget(
                  id: widget.parentID,
                  name: widget.name,
                  isBackRequest: true,
                )
              : Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String name = widget.inventoryTrackerList[index].name;
                      String image =
                          widget.inventoryTrackerList[index].imageUrl;
                      return eachInventoryTrackerWidget(image, name, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                  parentID: widget
                                      .inventoryTrackerList[index].id
                                      .toString(),
                                  name: name,
                                  isScanBarCode: false,
                                  productList: const [])),
                        );
                      });
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: widget.inventoryTrackerList.length,
                  ),
                ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
