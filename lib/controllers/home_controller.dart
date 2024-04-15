import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/models/ongoing_job.dart';
import 'package:unidbox_app/services/home_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

class HomeController extends GetxController {
  List<OngoingJob> ongoingJobList = [];
  bool isOngoingJobLoading = false;

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
