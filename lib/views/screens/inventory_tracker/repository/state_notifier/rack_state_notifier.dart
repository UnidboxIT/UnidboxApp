import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../domain/racks.dart';
import '../state/rack_state.dart';

class RackStateNotifier extends StateNotifier<RackState> {
  RackStateNotifier(this._inventoryTrackerRepository)
      : super(const RackState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Racks> racksList = [];
  Future<void> getRacks(List selectedRack) async {
    try {
      state = const RackState.loading();
      Response response = await _inventoryTrackerRepository.racks();
      var result = jsonDecode(response.body);
      racksList.clear();
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          racksList.add(Racks.fromJson(element));
        }

        racksList.sort((a, b) {
          int aIndex = selectedRack.indexOf(a.id);
          int bIndex = selectedRack.indexOf(b.id);
          if (aIndex != -1 && bIndex != -1) {
            return aIndex.compareTo(bIndex);
          } else if (aIndex != -1) {
            return -1;
          } else if (bIndex != -1) {
            return 1;
          } else {
            return a.id.compareTo(b.id);
          }
        });
        state = RackState.loadRackList(racksList);
      }
    } catch (e) {
      superPrint(e);
    }
  }

  Future<void> updateProductDetail(String productID, List rackList,
      String retailPrice, String costPrice, BuildContext context, ref) async {
    try {
      state = const RackState.updateLoading();
      Response response = await _inventoryTrackerRepository.updateProduct(
          productID, rackList, retailPrice, costPrice);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['code'] == 200) {
        superPrint(result);
        successfullyBottomSheet("Update Confirmation",
            "Please ensure the retail price is \n 20% margin of the cost price",
            () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }, context);
      }
      state = const RackState.success();
    } catch (e) {
      superPrint(e);
    }
  }
}
