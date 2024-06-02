import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/main_uom_state.dart';
import '../../../../../../utils/commons/super_print.dart';

class MainUomStateNotifier extends StateNotifier<MainUomState> {
  MainUomStateNotifier(this._inventoryTrackerRepository)
      : super(const MainUomState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Uom> uomList = [];
  Future<void> getMainUom() async {
    try {
      state = const MainUomState.loading();
      uomList.clear();
      Response response = await _inventoryTrackerRepository.uom();
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        uomList.add(Uom.fromJson(element));
      }

      state = MainUomState.loadMainUomList(uomList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  void eachSelectedUom(Uom uom) {
    state = MainUomState.selectedMainUom(uom);
    superPrint(uom.name);
    superPrint(uom.id);
  }
}
