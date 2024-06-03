import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/attribute.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/attribute_state.dart';

import '../../../../../../utils/constant/app_color.dart';
import '../../../repository/provider/create_product_provider.dart';

Attribute selectedAttribute = Attribute();
List<Map<String, dynamic>> attributeMapList = [];
Map<String, dynamic> attributeMap = {};

class ShowAttributeDropdown extends ConsumerStatefulWidget {
  final String id;
  final String name;
  const ShowAttributeDropdown(
      {super.key, required this.id, required this.name});

  @override
  ConsumerState<ShowAttributeDropdown> createState() =>
      _ShowAttributeDropdownState();
}

class _ShowAttributeDropdownState extends ConsumerState<ShowAttributeDropdown> {
  TextEditingController txtSearch = TextEditingController();
  List<Attribute> attributeListByID = [];

  @override
  void initState() {
    super.initState();
  }

  updateSelectedUom(String attributeId, String attributeValues) {
    for (var data in attributeListByID) {
      if (data.name.contains(attributeValues)) {
        setState(() {
          selectedAttribute = Attribute(id: data.id, name: data.name);
          ref
              .read(attributeStateNotifierProvider.notifier)
              .eachSelectedUom(selectedAttribute);
        });
      }
    }
    attributeMap.addAll({widget.id: selectedAttribute});
    bool isUpdated = false;
    // Check if the list is not empty
    if (attributeMapList.isNotEmpty) {
      for (var data in attributeMapList) {
        if (data["attribute_id"].toString() == widget.id.toString()) {
          data["value_id"] = selectedAttribute.id;
          isUpdated = true;
          break; // Exit the loop since the update is done
        }
      }

      // If the attribute_id was not found, add the new entry
      if (!isUpdated) {
        attributeMapList.add({
          "attribute_id": int.parse(widget.id),
          "value_id": selectedAttribute.id,
        });
      }
    } else {
      attributeMapList.add({
        "attribute_id": int.parse(widget.id),
        "value_id": selectedAttribute.id,
      });
    }

    superPrint(attributeMapList);
    superPrint(attributeMap.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(attributeStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          attributeListByID = [];
        });
      }
      if (next is AttributeListByID) {
        setState(() {
          attributeListByID = next.attributeListByID;
        });
      }
    });

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        autofocus: true,
        isDense: true,
        hint: Text(
          widget.name,
          style: TextStyle(
              fontSize: 13,
              color: AppColor.fontColor.withOpacity(0.6),
              fontWeight: FontWeight.w500),
        ),
        items: attributeListByID
            .map((item) => DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ))
            .toList(),
        value: selectedAttribute.name.isEmpty ? null : selectedAttribute.name,
        onChanged: (value) {
          updateSelectedUom(widget.id, value!);
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                hintText: 'Search nationality',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.bgColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.primary)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.dropshadowColor)),
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
    );
  }
}
