import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/home/my_task.dart';
import '../../services/home_service.dart';
import '../../utils/commons/super_print.dart';

class InventoryController extends GetxController {
  // List<MyTask> myTaskDetailList = [];

  // Future<void> getMyTaskByID(String parentID) async {
  //   try {
  //     http.Response response = await HomeService.myTaskByID(parentID);
  //     var result = jsonDecode(response.body);
  //     myTaskDetailList.clear();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Iterable dataList = result['result']['records'];
  //       for (var element in dataList) {
  //         myTaskDetailList.add(MyTask.fromJson(element));
  //       }
  //     }
  //   } catch (e) {
  //     superPrint(e.toString());
  //   }

  //   update();
  // }
}
