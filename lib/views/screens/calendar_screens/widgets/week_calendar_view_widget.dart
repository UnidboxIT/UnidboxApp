// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:unidbox_app/utils/constant/app_color.dart';
// import 'package:unidbox_app/views/widgets/text_widget.dart';

// class WeekCalendarViewWidget extends StatefulWidget {
//   const WeekCalendarViewWidget({super.key});

//   @override
//   State<WeekCalendarViewWidget> createState() => _WeekCalendarViewWidgetState();
// }

// class _WeekCalendarViewWidgetState extends State<WeekCalendarViewWidget> {
// // Get today's date
//   DateTime now = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 spreadRadius: 5,
//                 blurRadius: 5)
//           ],
//         ),
//         child: TableCalendar(
//           firstDay: DateTime.utc(2010, 10, 16),
//           lastDay: DateTime.utc(2030, 3, 14),
//           focusedDay: DateTime.now(),
//           calendarFormat: CalendarFormat.week,
//           headerVisible: false,
//           daysOfWeekHeight: 20,
//           calendarBuilders: CalendarBuilders(
//             outsideBuilder: (context, day, focusedDay) {
//               return Container(
//                 height: 40,
//                 width: 40,
//                 alignment: Alignment.center,
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle, color: Colors.white),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     textWidget(day.day.toString(), color: Colors.grey.shade400),
//                     const SizedBox(
//                       width: 5,
//                       height: 5,
//                     )
//                   ],
//                 ),
//               );
//             },
//             defaultBuilder: (context, day, focusedDay) {
//               int differenceInDays = day.difference(now).inDays;
//               return Container(
//                 height: 40,
//                 width: 40,
//                 alignment: Alignment.center,
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle, color: Colors.white),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     textWidget(day.day.toString()),
//                     differenceInDays < 4 && day.month == now.month
//                         ? Container(
//                             width: 5,
//                             height: 5,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: AppColor.orangeColor),
//                           )
//                         : Container()
//                   ],
//                 ),
//               );
//             },
//             todayBuilder: (context, day, focusedDay) {
//               return Container(
//                 height: 40,
//                 width: 40,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.lightBlueAccent.withOpacity(0.15),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     textWidget(day.day.toString()),
//                     Container(
//                       width: 5,
//                       height: 5,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red,
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
