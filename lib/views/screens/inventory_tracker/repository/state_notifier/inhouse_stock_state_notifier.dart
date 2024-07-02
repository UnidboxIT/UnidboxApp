import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/inhouse_stock_state.dart';
import '../../../../../utils/commons/super_print.dart';
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
      superPrint(result['result']['result'], title: "In House Stock");
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['result'];
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

  selectedRequestBox(int uomIndex) {
    state = InhouseStockState.selectedBox(uomIndex);
  }

  incrementTotalQty(int qty) {
    qty++;
    state = InhouseStockState.incrementQty(qty);
  }

  decrementTotalQty(int qty) {
    if (qty > 1) {
      qty--;
      state = InhouseStockState.decrementQty(qty);
    }
  }

  defaultWarehouseIncrementQty(String productID, int qty) {
    qty++;
    state = InhouseStockState.defaultWarehouseQtyIncrement(productID, qty);
  }

  defaultWarehouseDecrementQty(String productID, int qty) {
    if (qty > 1) {
      qty--;
      state = InhouseStockState.defaultWarehouseQtyDecrement(productID, qty);
    }
  }

  bool isUrgent = false;
  selectedUrgent() {
    isUrgent = !isUrgent;
    state = InhouseStockState.urgent(isUrgent);
  }

  selectedWarehouseUrgent(String productID, bool isUrgent) {
    state = InhouseStockState.selectedWarehouseUrgent(productID, isUrgent);
  }

  unselectedWarehouseUrgent(String productID, bool isUrgent) {
    state = InhouseStockState.unselectedWarehouseUrgent(productID, isUrgent);
  }

  overQuantity(bool isOver) {
    state = InhouseStockState.isOverQuantity(isOver);
  }

  selectedWarehouseID(int warehouseID) {
    state = InhouseStockState.selectedWarehouse(warehouseID);
  }
}
