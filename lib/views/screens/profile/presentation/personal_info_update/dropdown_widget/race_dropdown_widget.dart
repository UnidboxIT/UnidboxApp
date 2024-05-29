import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/profile/domain/profile.dart';
import 'package:unidbox_app/views/screens/profile/domain/race.dart';
import 'package:unidbox_app/views/screens/profile/repository/provider/profile_state_notifier_provider.dart';
import '../../../../../../../utils/constant/app_color.dart';
import '../../../repository/state/race_state.dart';

class RaceDropdownWidget extends ConsumerStatefulWidget {
  final Profile profile;
  const RaceDropdownWidget({super.key, required this.profile});

  @override
  ConsumerState<RaceDropdownWidget> createState() => _RaceDropdownWidgetState();
}

class _RaceDropdownWidgetState extends ConsumerState<RaceDropdownWidget> {
  TextEditingController txtSearch = TextEditingController();
  List<Race> raceList = [];
  Race selectedRace = Race();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRace();
  }

  loadRace() {
    setState(() {
      selectedRace =
          Race(id: widget.profile.race[0], name: widget.profile.race[1]);
      Future.delayed(const Duration(milliseconds: 10), () {
        ref
            .read(raceStateNotifierProvider.notifier)
            .eachSelectedCountry(selectedRace);
      });
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(raceStateNotifierProvider.notifier).getRace(selectedRace.name);
    });
  }

  updateSelectedRaceData(values) {
    for (var data in raceList) {
      if (data.name.contains(values)) {
        setState(() {
          selectedRace = Race(id: data.id, name: data.name);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(raceStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          raceList = [];
        });
      }
      if (next is RaceList) {
        setState(() {
          raceList = next.raceList;
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
        items: raceList
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
        value: selectedRace.name,
        onChanged: (value) {
          updateSelectedRaceData(value);
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
                hintText: 'Search race',
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
