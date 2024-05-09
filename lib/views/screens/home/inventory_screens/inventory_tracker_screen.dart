import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/inventory_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/details/inventory_tracker_sub_category_screen.dart';
import '../../../../controllers/home_controllers/product_controller.dart';
import 'create_product_screen.dart';
import 'widgets/each_inventory_tracker_widget.dart';
import 'widgets/inventory_app_bar_widget.dart';
import 'widgets/search_text_field_widget.dart';

class InventoryTrackerScreen extends StatelessWidget {
  const InventoryTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    Get.find<InventoryController>().getAllInventoryTracker();
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
                  Get.back();
                },
                () {
                  Get.to(() => const CreateProductScreen());
                },
                Icons.add,
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: inventoryTrackerBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inventoryTrackerBodyWidget() {
    return Container(
      width: 100.w,
      height: 82.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: GetBuilder<InventoryController>(
        builder: (controller) {
          return Column(
            children: [
              searchTextFieldWidget(),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String id = controller
                          .searchInventoryTrackerList[index].id
                          .toString();
                      String name =
                          controller.searchInventoryTrackerList[index].name;
                      String image =
                          controller.searchInventoryTrackerList[index].imageUrl;

                      return eachInventoryTrackerWidget(
                        image,
                        name,
                        () {
                          Get.to(
                            () => InventoryTrackerSubCategoryScreen(
                              parentID: id,
                              name: name,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: controller.searchInventoryTrackerList.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
