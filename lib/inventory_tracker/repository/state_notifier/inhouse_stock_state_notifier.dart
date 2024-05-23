import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/inhouse_stock_state.dart';
import '../../../utils/commons/super_print.dart';
import '../../domain/inhouse_stock.dart';

class InhouseStockStateNotifier extends StateNotifier<InhouseStockState> {
  InhouseStockStateNotifier(this._inventoryTrackerRepository)
      : super(const InhouseStockState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<InhouseStock> inHouseStockList = [];

  Future<void> getInHouseStock(int productID) async {
    try {
      state = const InhouseStockState.loading();
      Response response =
          await _inventoryTrackerRepository.inhouseStock(productID);
      var result = jsonDecode(response.body);
      superPrint(result['result']['result']);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['result'];
        superPrint(dataList.length);
        inHouseStockList.clear();
        for (var data in dataList) {
          inHouseStockList.add(InhouseStock.fromJson(data));
        }
        state = InhouseStockState.loadInHouseStock(inHouseStockList);
      }
    } catch (e) {
      state = InhouseStockState.error(error: e.toString());
      superPrint(e);
    }
  }
}
