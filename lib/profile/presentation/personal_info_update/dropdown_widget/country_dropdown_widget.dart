import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/domain/country.dart';
import 'package:unidbox_app/profile/domain/profile.dart';
import 'package:unidbox_app/profile/repository/provider/profile_state_notifier_provider.dart';
import 'package:unidbox_app/profile/repository/state/country_state.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../utils/constant/app_color.dart';

class CountryDropdownWidget extends ConsumerStatefulWidget {
  final Profile profile;
  const CountryDropdownWidget({super.key, required this.profile});

  @override
  ConsumerState<CountryDropdownWidget> createState() =>
      _CountryDropdownWidgetState();
}

class _CountryDropdownWidgetState extends ConsumerState<CountryDropdownWidget> {
  TextEditingController txtSearch = TextEditingController();
  List<Country> countryList = [];
  Country selectedCountry = Country();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedCountry = Country(
          id: widget.profile.countryList[0],
          name: widget.profile.countryList[1]);
      Future.delayed(const Duration(milliseconds: 10), () {
        ref
            .read(countryStateNotifierProvider.notifier)
            .eachSelectedCountry(selectedCountry);
      });
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(countryStateNotifierProvider.notifier)
          .getCountry(selectedCountry.name);
    });
  }

  updateSelectedCountryData(values) {
    for (var data in countryList) {
      if (data.name.contains(values)) {
        setState(() {
          selectedCountry = Country(id: data.id, name: data.name);
          ref
              .read(countryStateNotifierProvider.notifier)
              .eachSelectedCountry(selectedCountry);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(countryStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          countryList = [];
        });
      }
      if (next is CountryList) {
        setState(() {
          countryList = next.countryList;
        });
      }
    });

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        autofocus: true,
        isDense: true,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: countryList
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
        value: selectedCountry.name,
        onChanged: (value) {
          updateSelectedCountryData(value);
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
              autofocus: true,
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
