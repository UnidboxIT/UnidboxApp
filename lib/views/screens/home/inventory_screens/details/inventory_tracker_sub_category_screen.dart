import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/inventory_controller.dart';
import 'package:unidbox_app/models/home/inventory_tracker.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/home/inventory_screens/widgets/product_widget.dart';
import '../create_product_screen.dart';
import '../product_screen.dart';
import '../widgets/each_inventory_tracker_widget.dart';
import '../widgets/inventory_app_bar_widget.dart';
import '../widgets/search_text_field_widget.dart';

class InventoryTrackerSubCategoryScreen extends StatelessWidget {
  final String parentID;
  final String name;
  const InventoryTrackerSubCategoryScreen(
      {super.key, required this.parentID, required this.name});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
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
                child: subCategoryBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subCategoryBodyWidget() {
    return Container(
      width: 100.w,
      height: 82.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: GetBuilder<InventoryController>(builder: (controller) {
        List<InventoryTracker> inventoryTrackerList =
            controller.inventoryTrackerDetailMap[int.parse(parentID)] ?? [];
        return Column(
          children: [
            searchTextFieldWidget(),
            inventoryTrackerList.isEmpty
                ? ProductWidget(
                    id: parentID,
                    name: name,
                  )
                : Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          superPrint(inventoryTrackerList[index].parentID);

                          String name = inventoryTrackerList[index].name;
                          String image = inventoryTrackerList[index].imageUrl;
                          return eachInventoryTrackerWidget(image, name, () {
                            Get.to(() => ProductScreen(
                                  parentID:
                                      inventoryTrackerList[index].id.toString(),
                                  name: name,
                                ));
                          });
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: inventoryTrackerList.length),
                  ),
          ],
        );
      }),
    );
  }
}
