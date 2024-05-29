import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/back_up/home/create_product_widget/each_text_field_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/rack_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/rack_state.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/racks.dart';

class ProductDetailUpdateScreen extends ConsumerStatefulWidget {
  final String productID;
  final List rackIdList;
  final String retailPrice;
  final String costPrice;

  const ProductDetailUpdateScreen(
      {super.key,
      required this.productID,
      required this.rackIdList,
      required this.retailPrice,
      required this.costPrice});

  @override
  ConsumerState<ProductDetailUpdateScreen> createState() =>
      _ProductDetailUpdateScreenState();
}

class _ProductDetailUpdateScreenState
    extends ConsumerState<ProductDetailUpdateScreen> {
  TextEditingController txtSearch = TextEditingController();
  TextEditingController txtRetailPrice = TextEditingController();
  TextEditingController txtCostPrice = TextEditingController();
  List<Racks> racksList = [];
  List<Racks> selectedRacks = [];
  List selectedRackIdList = [];
  bool isUpdate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    setState(() {
      txtRetailPrice.text = widget.retailPrice;
      txtCostPrice.text = widget.costPrice;
    });
    superPrint(widget.rackIdList);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(rackStateNotifierProvider.notifier).getRacks(widget.rackIdList);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(rackStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          racksList = [];
          selectedRacks = [];
        });
      }

      if (next is RackList) {
        setState(() {
          racksList = next.rackList;
          for (var data in racksList) {
            if (widget.rackIdList.contains(data.id)) {
              selectedRacks.add(data);
            }
          }
        });
      }

      if (next is UpdateLoading) {
        setState(() {
          isUpdate = true;
        });
      }
      if (next is Success) {
        setState(() {
          isUpdate = false;
        });
      }
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
                    Navigator.of(context).pop();
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
          eachTextFieldWidget("Retail Price", txtRetailPrice, ""),
          const SizedBox(height: 10),
          eachTextFieldWidget("Cost Price", txtCostPrice, ""),
          const Spacer(),
          SizedBox(
              width: 30.w,
              child: buttonWidget("Update", () {
                selectedRackIdList.clear();
                for (var data in selectedRacks) {
                  selectedRackIdList.add(data.id);
                  superPrint(data.name);
                }

                ref
                    .read(rackStateNotifierProvider.notifier)
                    .updateProductDetail(
                      widget.productID,
                      selectedRackIdList,
                      txtRetailPrice.text,
                      txtCostPrice.text,
                      context,
                      ref,
                    );
              }, isBool: isUpdate)),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget rackDropDownWidget() {
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
              hint: const Text(
                'Select Rack',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              items: racksList.map((item) {
                return DropdownMenuItem<String>(
                  value: item.name,
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = selectedRacks.contains(item);
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isSelected
                                ? selectedRacks.remove(item)
                                : selectedRacks.add(item);
                          });

                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              if (isSelected)
                                const Icon(Icons.check_box_outlined)
                              else
                                const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              onChanged: (value) {
                superPrint(value);
              },
              value: selectedRacks.isEmpty ? null : selectedRacks.last.name,
              selectedItemBuilder: (context) {
                String joinedNames =
                    selectedRacks.map((rack) => rack.name).join(', ');
                return racksList.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        joinedNames,
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    );
                  },
                ).toList();
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
                searchController: txtSearch,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextFormField(
                    autofocus: false,
                    expands: true,
                    maxLines: null,
                    controller: txtSearch,
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
                  txtSearch.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
