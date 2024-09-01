import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/inventory_category_screen.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/each_inventory_tracker_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/inventory_app_bar_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/widgets/search_text_field_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/inventory_tracker_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/inventory_tacker_state.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import '../domain/inventory_tracker.dart';
import '../domain/product.dart';
import '../repository/provider/product_provider.dart';
import '../repository/state/insufficient_stock_state.dart';
import 'create_product/create_product_screen.dart';
import 'widgets/insufficient_product_widget.dart';

class InventoryTrackerScreen extends ConsumerStatefulWidget {
  const InventoryTrackerScreen({super.key});

  @override
  ConsumerState<InventoryTrackerScreen> createState() =>
      _InventoryTrackerScreenState();
}

class _InventoryTrackerScreenState
    extends ConsumerState<InventoryTrackerScreen> {
  List<InventoryTracker> inventoryTrackerList = [];
  Map<int, List<InventoryTracker>> inventoryTrackerDetailMap = {};
  List<Products> insufficientProductList = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(inventroyTrackerStateNotifier.notifier).getAllInventoryTracker();
    });
    ref.read(insufficientStockStateNotifier.notifier).clearProductValue();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(insufficientStockStateNotifier.notifier)
          .insufficientStackProduct(0);
    });
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   ref.read(userWarehouseStateNotifierProvider.notifier).getWarehouse();
    // });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(inventroyTrackerStateNotifier, (prev, next) {
      if (next is Loading) {
        inventoryTrackerList = [];
      }
      if (next is InventoryTrackerList) {
        setState(() {
          inventoryTrackerList = next.inventoryTracker;
        });
      }
      if (next is CategoryListMap) {
        setState(() {
          inventoryTrackerDetailMap = next.categoryMap;
        });
      }
    });

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
          isLoading = false;
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
                "Inventory Tracker",
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
                offset: Offset(0, 15.h),
                child:
                    inventoryTrackerBodyWidget(inventoryTrackerList, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inventoryTrackerBodyWidget(
      List<InventoryTracker> inventoryTrackerList, BuildContext context) {
    return Container(
      width: 100.w,
      height: 82.h,
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
          insufficientProductWidget(context, insufficientProductList),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String id = inventoryTrackerList[index].id.toString();
                  String name = inventoryTrackerList[index].name;
                  String image = inventoryTrackerList[index].imageUrl;

                  return eachInventoryTrackerWidget(
                    image,
                    name,
                    () {
                      Navigator.of(context, rootNavigator: false)
                          .push(MaterialPageRoute(
                        builder: (context) => InventoryTrackerSubCategoryScreen(
                          parentID: id,
                          name: name,
                          inventoryTrackerList: inventoryTrackerDetailMap[
                                  inventoryTrackerList[index].id] ??
                              [],
                        ),
                      ));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: inventoryTrackerList.length),
          ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
