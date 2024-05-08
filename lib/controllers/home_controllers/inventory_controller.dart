import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/models/home/inventory_tracker.dart';
import 'package:unidbox_app/services/inventory_service.dart';
import '../../utils/commons/super_print.dart';

class InventoryController extends GetxController {
  List<InventoryTracker> inventoryTrackerList = [];

  Future<void> getAllInventoryTracker() async {
    try {
      http.Response response = await InventoryService.inventoryTracker();
      var result = jsonDecode(response.body);
      inventoryTrackerList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          inventoryTrackerList.add(InventoryTracker.fromJson(element));
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    update();
  }
}
