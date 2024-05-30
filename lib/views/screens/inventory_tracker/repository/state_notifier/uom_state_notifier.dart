import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/uom_state.dart';
import '../../../../../utils/commons/super_print.dart';

class UomStateNotifier extends StateNotifier<UomState> {
  UomStateNotifier(this._inventoryTrackerRepository)
      : super(const UomState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Uom> uomList = [];
  Future<void> getUom() async {
    try {
      state = const UomState.loading();
      Response response = await _inventoryTrackerRepository.uom();
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      uomList.clear();
      for (var element in dataList) {
        uomList.add(Uom.fromJson(element));
      }
      state = UomState.loadUomList(uomList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  void eachSelectedUom(Uom uom) {
    state = UomState.selectedUom(uom);
    superPrint(uom.name);
  }
}
