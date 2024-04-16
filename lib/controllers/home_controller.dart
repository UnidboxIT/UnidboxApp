import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/models/ongoing_job.dart';
import 'package:unidbox_app/services/home_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

class HomeController extends GetxController {
  List<OngoingJob> ongoingJobList = [];
  bool isOngoingJobLoading = false;
  String timeText = "";

  calculateTime() {
    DateTime now = DateTime.now();
    DateTime morningStart = DateTime(now.year, now.month, now.day, 5, 0, 0);
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 11, 59, 59);
    DateTime afternoonStart = DateTime(now.year, now.month, now.day, 12, 0, 0);
    DateTime afternoonEnd = DateTime(now.year, now.month, now.day, 16, 59, 59);
    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
      timeText = "Good morning,";
    } else if (now.isAfter(afternoonStart) && now.isBefore(afternoonEnd)) {
      timeText = "Good afternoon,";
    }
    update();
  }

  Future<void> getAllOngoingJob() async {
    isOngoingJobLoading = true;
    try {
      http.Response response = await HomeService.ongoingJob();
      var result = jsonDecode(response.body);
      ongoingJobList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          ongoingJobList.add(OngoingJob.fromJson(element));
        }
        superPrint(ongoingJobList);
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isOngoingJobLoading = false;
    update();
  }
}
