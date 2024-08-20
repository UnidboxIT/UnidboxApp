import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/inventory_tacker_state.dart';
import 'package:http/http.dart' as http;
import '../../domain/inventory_tracker.dart';

class InventoryTrackerStateNotifier
    extends StateNotifier<InventoryTrackerState> {
  InventoryTrackerStateNotifier(this._inventoryTrackerRepository)
      : super(const InventoryTrackerState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<InventoryTracker> inventoryTrackerList = [];
  List<InventoryTracker> tempInventoryTrackerList = [];
  Map<int, List<InventoryTracker>> inventoryTrackerDetailMap = {};

  Future<void> getAllInventoryTracker() async {
    try {
      state = const InventoryTrackerState.loading();
      http.Response response =
          await _inventoryTrackerRepository.inventoryTracker();
      var result = jsonDecode(response.body);
      inventoryTrackerList.clear();
      tempInventoryTrackerList.clear();
      inventoryTrackerDetailMap.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          tempInventoryTrackerList.add(InventoryTracker.fromJson(element));
        }
        for (var eachCategory in tempInventoryTrackerList) {
          if (eachCategory.parentID.isEmpty) {
            inventoryTrackerList.add(eachCategory);
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
        state = InventoryTrackerState.loadInventoryTrcker(inventoryTrackerList);
        state = InventoryTrackerState.loadCategory(inventoryTrackerDetailMap);
      }
    } catch (e) {
      state = InventoryTrackerState.error(error: e.toString());
    }
  }
}
