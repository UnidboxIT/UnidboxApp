import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/presentation/outlet_return_history/outlet_return_history_screen.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/repository/provider/outlet_return_provider.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../my_return/presentation/my_return_history/my_return_history_screen.dart';
import '../../../my_return/repository/provider/my_return_provider.dart';

class FilterByDateWidget extends ConsumerStatefulWidget {
  final bool isMyReturn;
  const FilterByDateWidget({super.key, required this.isMyReturn});

  @override
  ConsumerState<FilterByDateWidget> createState() => _FilterByDateWidgetState();
}

class _FilterByDateWidgetState extends ConsumerState<FilterByDateWidget> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String selectedDateRange = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 45,
        width: 100.w,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColor.dropshadowColor,
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget("Filter date", color: Colors.grey.shade400, size: 13),
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      insetPadding: const EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: getDateRangePicker(dialogContext),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.transparent,
                width: 20.w,
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.calendar_month_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getDateRangePicker(BuildContext dialogContext) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SfDateRangePicker(
        backgroundColor: Colors.white,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: selectionChanged,
        initialSelectedRange: PickerDateRange(startDate, endDate),
        showActionButtons: true,
        onSubmit: (value) {
          Navigator.of(dialogContext).pop();
        },
        onCancel: () {
          setState(() {
            startDate = DateTime.now();
            endDate = DateTime.now();
            selectedDateRange =
                "${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(startDate))} - ${DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy').format(endDate))}";
            Navigator.of(dialogContext).pop();
          });
        },
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectedDateRange =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      List<String> selectedDates = selectedDateRange.split(' - ');
      startDate = DateFormat('dd/MM/yyyy').parse(selectedDates[0]);
      endDate = DateFormat('dd/MM/yyyy').parse(selectedDates[1]);
      superPrint(startDate);
      superPrint(endDate);
      // myReturnedDateFilteredData.clear();
      // myReturnedDateFilteredData =
      //     filterDataByDateRange(requestedHistoryList, startDate, endDate);
      superPrint(widget.isMyReturn);
      if (widget.isMyReturn) {
        ref.read(myReturnStateNotifierProvider.notifier).dateFilterMyReturn(
            filterDataByDateRange(requestedHistoryList, startDate, endDate));
      } else {
        ref.read(outletReturnStateNotifier.notifier).dateFilterOutletReturn(
            filterDataByDateRange(
                requestedOutletReturnHistoryList, startDate, endDate));
      }

      superPrint(selectedDateRange);
    });
  }

  List<Map<String, dynamic>> filterDataByDateRange(
      List<Map<String, dynamic>> data, DateTime startDate, DateTime endDate) {
    superPrint(startDate);
    superPrint(endDate);
    return data
        .map((entry) {
          Map<String, dynamic> filteredEntry = {};
          entry.forEach((keyDate, value) {
            superPrint(value);
            DateTime date = DateTime.parse(keyDate);
            if (date.isAtSameMomentAs(startDate) ||
                date.isAtSameMomentAs(endDate) ||
                (date.isAfter(startDate) && date.isBefore(endDate))) {
              filteredEntry[keyDate] = value;
            }
          });
          return filteredEntry;
        })
        .where((filteredEntry) => filteredEntry.isNotEmpty)
        .toList();
  }
}
