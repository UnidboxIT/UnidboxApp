import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:unidbox_app/models/job_order/job_order.dart';
import 'package:unidbox_app/services/job_order_service.dart';
import '../../../models/job_order/handyman.dart';

class CalendarController extends GetxController {
  bool isMonthlyVisible = true;
  bool isShowAllFullScreenSize = false;
  List<String> handymanTimeFree = [
    "09:00 AM",
    "12:00 PM",
    "04:00 PM",
    "07:00 PM",
    "10:00 PM",
  ];

  List<HandyMan> handymanList = [];
  List<JobOrder> jobOrderList = [];
  Map<String, List<JobOrder>> dateRangeMap = {};

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  updateSelectedDateTime(DateTime dateTime) {
    selectedDay = dateTime;
    update();
  }

  toggleMonthlyVisible() {
    isMonthlyVisible = !isMonthlyVisible;
    update();
  }

  toggleShowFullScreenSize() {
    isShowAllFullScreenSize = !isShowAllFullScreenSize;
    update();
  }

  Future<void> jobOrderByDateRate(String firstDate, String lastDate) async {
    try {
      http.Response response =
          await JobOrderService.joborder(firstDate, lastDate);
      jobOrderList.clear();
      dateRangeMap.clear();
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            jobOrderList.add(JobOrder.fromJson(element));
          }
        }

        for (var data in jobOrderList) {
          String fromDate = data.fromDate;
          DateTime fromDateTime = DateTime.parse(fromDate);
          String toDate = data.toDate;
          DateTime toDateTime = DateTime.parse(toDate);
          DateTime from = DateTime(
              fromDateTime.year,
              fromDateTime.month,
              fromDateTime.day,
              fromDateTime.hour + 6,
              fromDateTime.minute + 30,
              fromDateTime.second);
          String adjustedFromTime = DateFormat('h:mm a').format(from);
          DateTime to = DateTime(
              toDateTime.year,
              toDateTime.month,
              toDateTime.day,
              toDateTime.hour + 6,
              toDateTime.minute + 30,
              toDateTime.second);
          String adjustedToTime = DateFormat('h:mm a').format(to);
          String timeSlot = '$adjustedFromTime : $adjustedToTime';
          if (dateRangeMap.containsKey(timeSlot)) {
            dateRangeMap[timeSlot.trim()]?.add(data);
          } else {
            dateRangeMap[timeSlot.trim()] = [data];
          }
        }
      } else {}
    } catch (e) {}
    update();
  }

  Future<void> getAllHandyMan() async {
    try {
      http.Response response = await JobOrderService.handyman();
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          handymanList.clear();
          for (var element in dataList) {
            handymanList.add(HandyMan.fromJson(element));
          }
        }
      } else {}
    } catch (e) {}
    update();
  }
}
