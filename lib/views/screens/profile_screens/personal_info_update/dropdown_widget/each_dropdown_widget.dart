import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;

Widget eachDropDownWidget() {
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      isExpanded: true,
      hint: Text(
        'Select Item',
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(Get.context!).hintColor,
        ),
      ),
      items: items
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (String? value) {
        selectedValue = value;
      },
      buttonStyleData: ButtonStyleData(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: 40,
        width: 100.w,
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    ),
  );
}
