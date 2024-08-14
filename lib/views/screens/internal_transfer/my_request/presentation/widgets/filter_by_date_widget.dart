import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class FilterByDateWidget extends StatefulWidget {
  const FilterByDateWidget({super.key});

  @override
  State<FilterByDateWidget> createState() => _FilterByDateWidgetState();
}

class _FilterByDateWidgetState extends State<FilterByDateWidget> {
  String? selectedDateRange;
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
        initialSelectedRange: PickerDateRange(DateTime.now(), DateTime.now()),
        showActionButtons: true,
        onSubmit: (value) {
          Navigator.of(dialogContext).pop();
        },
        onCancel: () {
          selectedDateRange = "";
          Navigator.of(dialogContext).pop();
          superPrint(selectedDateRange);
        },
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDateRange =
        '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
    superPrint(selectedDateRange);
  }
}

// Widget filterByDateWidget(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//     child: Container(
//       height: 45,
//       width: 100.w,
//       padding: const EdgeInsets.only(left: 10),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: AppColor.dropshadowColor,
//               blurRadius: 5,
//               spreadRadius: 5,
//             )
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           textWidget("Filter date", color: Colors.grey.shade400, size: 13),
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               color: Colors.transparent,
//               width: 20.w,
//               padding: const EdgeInsets.only(right: 10),
//               alignment: Alignment.centerRight,
//               child: const Icon(Icons.calendar_month_outlined),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

// DateRange? selectedDateRange;

// Widget datePickerBuilder(
//         BuildContext context, dynamic Function(DateRange) onDateRangeChanged) =>
//     DateRangePickerWidget(
//       displayMonthsSeparator: true,
//       doubleMonth: false,
//       maximumDateRangeLength: 10,
//       minimumDateRangeLength: 3,
//       initialDateRange: selectedDateRange,
//       onDateRangeChanged: (DateRange? value) {
//         selectedDateRange = value;
//       },
//       height: 350,
//       allowSingleTapDaySelection: true,
//       theme: const CalendarTheme(
//         selectedColor: Colors.blue,
//         dayNameTextStyle: TextStyle(color: Colors.black45, fontSize: 10),
//         inRangeColor: Color(0xFFD9EDFA),
//         inRangeTextStyle: TextStyle(color: Colors.blue),
//         selectedTextStyle: TextStyle(color: Colors.white),
//         todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
//         defaultTextStyle: TextStyle(color: Colors.black, fontSize: 12),
//         radius: 10,
//         tileSize: 40,
//         disabledTextStyle: TextStyle(color: Colors.grey),
//         quickDateRangeBackgroundColor: Color(0xFFFFF9F9),
//         selectedQuickDateRangeColor: Colors.blue,
//       ),
//     );
