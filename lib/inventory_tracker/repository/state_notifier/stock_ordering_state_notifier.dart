import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../utils/commons/super_print.dart';
import '../state/stock_ordering_state.dart';

class StockOrderingStateNotifier extends StateNotifier<StockOrderingState> {
  StockOrderingStateNotifier(this._inventoryTrackerRepository)
      : super(const StockOrderingState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<StockOrder> stockOrderList = [];

  Future<void> getStockOrder(int productID) async {
    try {
      state = const StockOrderingState.loading();
      Response response =
          await _inventoryTrackerRepository.stockOrder(productID);
      var result = jsonDecode(response.body);
      superPrint(result['result']['records']);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        stockOrderList.clear();
        for (var data in dataList) {
          stockOrderList.add(StockOrder.fromJson(data));
        }
        state = StockOrderingState.loadStockOrdering(stockOrderList);
      }
    } catch (e) {
      state = StockOrderingState.error(error: e.toString());
      superPrint(e);
    }
  }

  incrementTotalQty(int vendorId, Map<int, int> qtyMap) {
    Map<int, int> mutableQtyMap = Map.from(qtyMap);
    if (qtyMap.containsKey(vendorId)) {
      superPrint("HERE");
      mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! + 1;
    } else {
      mutableQtyMap[vendorId] = 1;
    }
    state = StockOrderingState.incrementStockOrderQty(mutableQtyMap);
  }

  decrementTotalQty(int vendorId, Map<int, int> qtyMap) {
    Map<int, int> mutableQtyMap = Map.from(qtyMap);
    if (mutableQtyMap.containsKey(vendorId)) {
      superPrint("HERE");
      if (mutableQtyMap[vendorId]! >= 1) {
        mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! - 1;
      }
      superPrint(mutableQtyMap[vendorId]);
    } else {
      mutableQtyMap[vendorId] = -1;
    }
    state = StockOrderingState.decremenStockOrderQty(mutableQtyMap);
  }
}
