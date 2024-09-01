import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/views/screens/auth/repository/auth_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../state/stock_ordering_state.dart';

class StockOrderingStateNotifier extends StateNotifier<StockOrderingState> {
  StockOrderingStateNotifier(
      this._inventoryTrackerRepository, this._sharedPreferences)
      : super(const StockOrderingState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;
  final SharedPreferences _sharedPreferences;

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
  ) async {
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
      existingOrder['product_qty'] =
          mutableQtyMap.values.reduce((a, b) => a + b);
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
    superPrint(checkOutMap);
    // Store data
    await storeOrderData(checkOutMap);

    // Retrieve data
    await retrieveOrderData();
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
    state = StockOrderingState.addOrder(mutableOrderLines);
    state = StockOrderingState.decremenStockOrderQty(mutableQtyMap);
  }

  // addToCartOrderForm(
  //   Map<String, Map<String, dynamic>> checkOutDataMap,
  // ) {
  //   // state = StockOrderingState.backupOrderList(orderLineList);
  //   state = StockOrderingState.backupCheckOut(checkOutDataMap);
  // }

  clearTotalQty(StockOrder stockOrder) {
    state = StockOrderingState.clearTotalQty({stockOrder.id: 1});
  }

  Future<void> storeOrderData(
      Map<String, Map<String, dynamic>> checkOutMap) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Convert data to JSON string and store
      String jsonData = jsonEncode(checkOutMap);
      await prefs.setString(AppKeys.orderForm, jsonData);
      print("Data stored successfully.");
    } catch (e) {
      print("Error storing data: $e");
    }
  }

  Future<void> retrieveOrderData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Retrieve JSON string
      String? jsonData = prefs.getString(AppKeys.orderForm);

      if (jsonData != null) {
        // Convert JSON string to Map
        Map<String, dynamic> data = jsonDecode(jsonData);
        print("Retrieved data: $data");
      } else {
        print("No data found.");
      }
    } catch (e) {
      print("Error retrieving data: $e");
    }
  }
}
