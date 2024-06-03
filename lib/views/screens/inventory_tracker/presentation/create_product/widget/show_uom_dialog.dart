import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/multi_uom_state.dart';

import '../../../domain/multi_uom.dart';
import 'product_variety_widget.dart';

class UomDropDownDialog extends ConsumerStatefulWidget {
  const UomDropDownDialog({super.key});

  @override
  ConsumerState<UomDropDownDialog> createState() => _UomDropDownDialogState();
}

class _UomDropDownDialogState extends ConsumerState<UomDropDownDialog> {
  TextEditingController txtSearch = TextEditingController();
  List<MultiUom> uomList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedUom = MultiUom(value: "", name: "");
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   ref.read(uomStateNotifierProvider.notifier).getUom();
    // });
  }

  updateSelectedUom(values) {
    setState(() {
      selectedUom = values ?? Uom(id: 0, name: ''); // Set default value if null
    });
    if (values != null) {
      setState(() {
        selectedUom = values;
      });
      ref.read(uomStateNotifierProvider.notifier).eachSelectedUom(selectedUom);
    }
    // for (var data in uomList) {
    //   if (data.name.contains(values)) {
    //     superPrint(data.id);
    //     setState(() {
    //       selectedUom = Uom(id: data.id, name: data.name);
    //       ref
    //           .read(uomStateNotifierProvider.notifier)
    //           .eachSelectedUom(selectedUom);
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(uomStateNotifierProvider, (pre, next) {
      if (next is LoadingUom) {
        setState(() {
          uomList = [];
        });
      }
      if (next is MultiUomList) {
        setState(() {
          uomList = next.uomList;
        });
      }
    });

    return DropdownButtonHideUnderline(
      child: DropdownButton2<MultiUom>(
        isExpanded: true,
        autofocus: true,
        isDense: true,
        hint: Text(
          'Select Uom',
          style: TextStyle(
              fontSize: 13,
              color: AppColor.fontColor.withOpacity(0.6),
              fontWeight: FontWeight.w500),
        ),
        items: uomList
            .map((item) => DropdownMenuItem<MultiUom>(
                  value: item,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedUom.name.isEmpty ? null : selectedUom,
        onChanged: (value) {
          updateSelectedUom(value);
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
