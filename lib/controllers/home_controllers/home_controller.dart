import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/models/home/my_task.dart';
import 'package:unidbox_app/models/home/ongoing_job.dart';
import 'package:unidbox_app/services/home_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

extension MapGetExtension<K, V> on Map<K, V> {
  V? get(String key) {
    return this[key];
  }
}

class HomeController extends GetxController {
  List<OngoingJob> ongoingJobList = [];
  List<MyTask> myTaskList = [];
  List<MyTask> myTaskDetailList = [];
  List<SelectionField> selectionList = [];

  bool isOngoingJobLoading = false;
  bool isMyTaskLoading = false;
  bool isMyTaskDetailLoading = false;
  String timeText = "";

  calculateTime() {
    DateTime now = DateTime.now();
    DateTime morningStart = DateTime(now.year, now.month, now.day, 5, 0, 0);
    DateTime morningEnd = DateTime(now.year, now.month, now.day, 11, 59, 59);
    DateTime afternoonStart = DateTime(now.year, now.month, now.day, 12, 0, 0);
    DateTime afternoonEnd = DateTime(now.year, now.month, now.day, 20, 59, 59);
    if (now.isAfter(morningStart) && now.isBefore(morningEnd)) {
      timeText = "Good morning,";
    } else if (now.isAfter(afternoonStart) && now.isBefore(afternoonEnd)) {
      timeText = "Good afternoon,";
    } else {
      timeText = "";
    }
    update();
  }

  Future<void> getAllMyTask() async {
    isMyTaskLoading = true;
    try {
      http.Response response = await HomeService.myTask();
      var result = jsonDecode(response.body);
      myTaskList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          myTaskList.add(MyTask.fromJson(element));
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isMyTaskLoading = false;
    update();
  }

  Future<void> getAllOngoingJob() async {
    isOngoingJobLoading = true;
    try {
      http.Response response = await HomeService.ongoingJob();
      Map<String, dynamic> result = jsonDecode(response.body);
      ongoingJobList.clear();
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            ongoingJobList.add(OngoingJob.fromJson(element));
          }
          selectionData();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['code'] == 100) {
          CommonMethods.unAuthorizedLogout();
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isOngoingJobLoading = false;
    update();
  }

  Future<void> selectionData() async {
    try {
      http.Response response = await HomeService.selectionField();
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          selectionList.add(SelectionField.fromJson(element));
        }
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }

  Future<void> getMyTaskByID(String parentID) async {
    isMyTaskDetailLoading = true;
    update();
    try {
      http.Response response = await HomeService.myTaskByID(parentID);
      var result = jsonDecode(response.body);
      myTaskDetailList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          myTaskDetailList.add(MyTask.fromJson(element));
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isMyTaskDetailLoading = false;
    update();
  }
}
