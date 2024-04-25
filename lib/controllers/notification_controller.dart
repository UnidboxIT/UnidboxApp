import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/noti_service.dart';
import '../models/noti.dart';

class NotificationController extends GetxController {
  bool isReminderLoading = false;
  List<Noti> notiList = [];

  bool isSwitched = false;

  void toggleSwitch(value) {
    isSwitched = value;
    update();
  }

  Future<void> getAllNotiReminder() async {
    try {
      http.Response response = await NotiService.notiReminder();
      var result = jsonDecode(response.body);
      notiList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          notiList.add(Noti.fromJson(element));
        }
      }
    } catch (e) {}
    update();
  }
}
