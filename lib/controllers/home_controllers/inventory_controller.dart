import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/models/home/inventory_tracker.dart';
import 'package:unidbox_app/services/inventory_service.dart';
import '../../utils/commons/super_print.dart';

class InventoryController extends GetxController {
  List<InventoryTracker> inventoryTrackerList = [];
  List<InventoryTracker> searchInventoryTrackerList = [];

  Map<int, List<InventoryTracker>> inventoryTrackerDetailMap = {};
  // List<InventoryTracker> inventoryTrackerSubCategoryList = [];
  // List<InventoryTracker> searchInventoryTrackerSubCategoryList = [];
  // bool isDetailLoading = false;

  TextEditingController txtSearch = TextEditingController();

  Future<void> filterInventroyCategory(String query) async {
    searchInventoryTrackerList.clear();
    if (query.isEmpty) {
      searchInventoryTrackerList.addAll(inventoryTrackerList);
    } else {
      searchInventoryTrackerList = inventoryTrackerList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  Future<void> getAllInventoryTracker() async {
    try {
      http.Response response = await InventoryService.inventoryTracker();
      var result = jsonDecode(response.body);
      searchInventoryTrackerList.clear();
      inventoryTrackerList.clear();
      inventoryTrackerDetailMap.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          inventoryTrackerList.add(InventoryTracker.fromJson(element));
        }

        for (var eachCategory in inventoryTrackerList) {
          if (eachCategory.parentID.isEmpty) {
            searchInventoryTrackerList.add(eachCategory);
          } else {
            if (inventoryTrackerDetailMap
                .containsKey(eachCategory.parentID[0])) {
              inventoryTrackerDetailMap[eachCategory.parentID[0]]
                  ?.add(eachCategory);
            } else {
              inventoryTrackerDetailMap[eachCategory.parentID[0]] = [
                eachCategory
              ];
            }
          }
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    update();
  }

  // Future<void> getInventoryTrackerByParentID(String parentID) async {
  //   isDetailLoading = true;
  //   update();
  //   try {
  //     http.Response response =
  //         await InventoryService.inventoryTrackerByID(parentID);
  //     var result = jsonDecode(response.body);
  //     inventoryTrackerSubCategoryList.clear();
  //     searchInventoryTrackerSubCategoryList.clear();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Iterable dataList = result['result']['records'];
  //       for (var element in dataList) {
  //         inventoryTrackerSubCategoryList
  //             .add(InventoryTracker.fromJson(element));
  //         searchInventoryTrackerSubCategoryList
  //             .add(InventoryTracker.fromJson(element));
  //       }
  //     }
  //   } catch (e) {
  //     superPrint(e.toString());
  //   }
  //   isDetailLoading = false;
  //   update();
  // }
}
