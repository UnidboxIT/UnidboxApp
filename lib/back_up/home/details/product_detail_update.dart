import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/back_up/controllers/home_controllers/product_detail_controller.dart';
import 'package:unidbox_app/back_up/models/home/racks.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/back_up/home/create_product_widget/each_text_field_widget.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';

import '../../../views/widgets/text_widget.dart';

class ProductDetailUpdateScreen extends StatelessWidget {
  final String productID;
  const ProductDetailUpdateScreen({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller = Get.find<ProductDetailController>();
      controller.getAllRacks();
      controller.selectedRackValue = Racks();
    });
    return SuperScaffold(
        topColor: AppColor.primary,
        botColor: const Color(0xffF6F6F6),
        child: Scaffold(
          backgroundColor: const Color(0xffF6F6F6),
          body: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Product Details",
                  () {
                    Get.back();
                  },
                ),
                Transform.translate(
                  offset: Offset(0, 15.h),
                  child: productDetailWidget(),
                )
              ],
            ),
          ),
        ));
  }

  Widget productDetailWidget() {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Container(
        width: 100.w,
        height: 81.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          children: [
            rackDropDownWidget(),
            const SizedBox(height: 10),
            eachTextFieldWidget("Retail Price", controller.txtRetailPrice, ""),
            const SizedBox(height: 10),
            eachTextFieldWidget("Cost Price", controller.txtCostPrice, ""),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    "In-house Quantity",
                    fontWeight: FontWeight.bold,
                    color: AppColor.pinkColor,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 100.w,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: textWidget(controller.inHouseQty),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(width: 30.w, child: buttonWidget("Update", () {})),
            SizedBox(height: 10.h),
          ],
        ),
      );
    });
  }

  Widget rackDropDownWidget() {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              "Rack",
              fontWeight: FontWeight.bold,
              color: AppColor.pinkColor,
            ),
            const SizedBox(height: 5),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                autofocus: true,
                isDense: true,
                hint: Text(
                  'No Rack',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(Get.context!).hintColor,
                  ),
                ),
                items: controller.racksList
                    .map((item) => DropdownMenuItem<String>(
                          value: item.name,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: controller.selectedRackValue.name.isEmpty
                    ? null
                    : controller.selectedRackValue.name,
                onChanged: (value) {
                  controller.updateSelectedRacksData(value);
                },
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 30.h,
                  decoration: BoxDecoration(
                    color: AppColor.bottomSheetBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: WidgetStatePropertyAll(AppColor.primary),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: controller.txtSearch,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: TextFormField(
                      autofocus: true,
                      expands: true,
                      maxLines: null,
                      controller: controller.txtSearch,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search racks',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColor.bgColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColor.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: AppColor.dropshadowColor)),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase());
                  },
                ),
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    controller.txtSearch.clear();
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
