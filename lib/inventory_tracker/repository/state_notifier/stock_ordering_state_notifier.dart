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

  incrementTotalQty(
    int vendorId,
    String vendorName,
    Map<int, int> qtyMap,
    List<Map<String, dynamic>> orderLineMap,
    Map<String, Map<String, dynamic>> checkOutDataMap,
    int productID,
    String productName,
    int uomID,
    double priceUnit,
    String image,
    String sku,
  ) {
    //increment qty
    Map<int, int> mutableQtyMap = Map.from(qtyMap);
    if (qtyMap.containsKey(vendorId)) {
      mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! + 1;
    } else {
      mutableQtyMap[vendorId] = 1;
    }

    //for orderlist to backend
    List<Map<String, dynamic>> mutableOrderLines = [];
    mutableOrderLines = List.from(orderLineMap);
    var existingOrder = mutableOrderLines.firstWhere(
        (order) => order['product_id'] == productID,
        orElse: () => {});

    if (existingOrder.isNotEmpty) {
      existingOrder['product_qty'] = mutableQtyMap[vendorId];
    } else {
      mutableOrderLines.add({
        'product_id': productID,
        'name': productName,
        'product_qty': mutableQtyMap[vendorId],
        'product_uom': uomID,
        'price_unit': priceUnit,
      });
    }

    //for show checkout detail screen
    Map<String, Map<String, dynamic>> checkOutMap = Map.from(checkOutDataMap);
    if (checkOutMap.containsKey(vendorName)) {
      checkOutMap[vendorName]!.addAll({
        'product_id': productID,
        'name': productName,
        'product_qty': mutableQtyMap[vendorId],
        'product_uom': uomID,
        'price_unit': priceUnit,
        "image": image,
        "sku": sku,
      });
    } else {
      checkOutMap[vendorName] = {
        'product_id': productID,
        'name': productName,
        'product_qty': mutableQtyMap[vendorId],
        'product_uom': uomID,
        'price_unit': priceUnit,
        "image": image,
        "sku": sku,
      };
    }
    state = StockOrderingState.checkOut(checkOutMap);
    state = StockOrderingState.addOrder(mutableOrderLines);
    state = StockOrderingState.incrementStockOrderQty(mutableQtyMap);
  }

  decrementTotalQty(
    int vendorId,
    String vendorName,
    Map<int, int> qtyMap,
    List<Map<String, dynamic>> orderLineMap,
    Map<String, Map<String, dynamic>> checkOutDataMap,
    int productID,
    String productName,
    int uomID,
    double priceUnit,
    String image,
    String sku,
  ) {
    Map<int, int> mutableQtyMap = Map.from(qtyMap);
    if (mutableQtyMap.containsKey(vendorId)) {
      if (mutableQtyMap[vendorId]! >= 1) {
        mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! - 1;
      }
    } else {
      mutableQtyMap[vendorId] = -1;
    }
    List<Map<String, dynamic>> mutableOrderLines = [];
    mutableOrderLines = List.from(orderLineMap);
    var existingOrder = mutableOrderLines.firstWhere(
        (order) => order['product_id'] == productID,
        orElse: () => {});

    if (existingOrder.isNotEmpty) {
      existingOrder['product_qty'] = mutableQtyMap[vendorId];
    }
    Map<String, Map<String, dynamic>> checkOutMap = Map.from(checkOutDataMap);
    if (checkOutMap.containsKey(vendorName)) {
      checkOutMap[vendorName]!.addAll({
        'product_id': productID,
        'name': productName,
        'product_qty': mutableQtyMap[vendorId],
        'product_uom': uomID,
        'price_unit': priceUnit,
        "image": image,
        "sku": sku,
      });
    } else {
      checkOutMap[vendorName] = {
        'product_id': productID,
        'name': productName,
        'product_qty': mutableQtyMap[vendorId],
        'product_uom': uomID,
        'price_unit': priceUnit,
        "image": image,
        "sku": sku,
      };
    }
    superPrint(checkOutMap);
    state = StockOrderingState.addOrder(mutableOrderLines);
    state = StockOrderingState.decremenStockOrderQty(mutableQtyMap);
  }

  clearTotalQty() {
    state = const StockOrderingState.clearTotalQty({});
  }
}
