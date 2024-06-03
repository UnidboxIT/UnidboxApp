import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/multi_uom.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/multi_uom_state.dart';
import '../../../../../../utils/commons/super_print.dart';

class UomStateNotifier extends StateNotifier<MultiUomState> {
  UomStateNotifier(this._inventoryTrackerRepository)
      : super(const MultiUomState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<MultiUom> uomList = [];
  Future<void> getMultiUom() async {
    try {
      state = const MultiUomState.loading();
      uomList.clear();
      Response response = await _inventoryTrackerRepository.multiUom();
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        uomList.add(MultiUom.fromJson(element));
      }
      superPrint(uomList);
      state = MultiUomState.loadUomList(uomList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  void eachSelectedUom(MultiUom uom) {
    state = MultiUomState.selectedUom(uom);
    superPrint(uom.name);
    superPrint(uom.value);
  }
}
