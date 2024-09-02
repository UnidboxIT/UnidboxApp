import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    Map<String, List<Map<String, dynamic>>> checkOutDataMap,
    int productID,
    String productName,
    int uomID,
    double priceUnit,
    String image,
    String sku,
  ) async {
    Map<String, List<Map<String, dynamic>>> storageDataMap =
        await retrieveOrderData();
    superPrint("Local Storage :::: $storageDataMap");

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

    // Prepare new product entry
    Map<String, dynamic> newProductEntry = {
      'product_id': productID,
      'name': productName,
      'product_qty': mutableQtyMap[vendorId],
      'product_uom': uomID,
      'price_unit': priceUnit,
      'image': image,
      'sku': sku,
    };

    // Update checkout data
    Map<String, List<Map<String, dynamic>>> mergedMap =
        Map.from(storageDataMap);
    if (checkOutDataMap.containsKey(vendorName)) {
      if (mergedMap.containsKey(vendorName)) {
        List<Map<String, dynamic>> existingProducts = mergedMap[vendorName]!;
        bool productExists = false;
        for (var product in existingProducts) {
          if (product['product_id'] == productID) {
            product['product_qty'] = mutableQtyMap[vendorId];
            productExists = true;
            break;
          }
        }
        if (!productExists) {
          existingProducts.add(newProductEntry);
        }
      } else {
        mergedMap[vendorName] = checkOutDataMap[vendorName]!;
      }
    } else {
      if (mergedMap.containsKey(vendorName)) {
        List<Map<String, dynamic>> existingProducts = mergedMap[vendorName]!;
        bool productExists = false;
        for (var product in existingProducts) {
          if (product['product_id'] == productID) {
            product['product_qty'] = mutableQtyMap[vendorId];
            productExists = true;
            break;
          }
        }
        if (!productExists) {
          existingProducts.add(newProductEntry);
        }
      } else {
        mergedMap[vendorName] = checkOutDataMap[vendorName]!;
      }
    }

    superPrint(mergedMap);
    //for show checkout detail screen
    // Map<String, Map<String, dynamic>> checkOutMap = Map.from(checkOutDataMap);
    // if (checkOutMap.containsKey(vendorName)) {
    //   checkOutMap[vendorName]!.addAll({
    //     'product_id': productID,
    //     'name': productName,
    //     'product_qty': mutableQtyMap[vendorId],
    //     'product_uom': uomID,
    //     'price_unit': priceUnit,
    //     "image": image,
    //     "sku": sku,
    //   });
    // } else {
    //   checkOutMap[vendorName] = {
    //     'product_id': productID,
    //     'name': productName,
    //     'product_qty': mutableQtyMap[vendorId],
    //     'product_uom': uomID,
    //     'price_unit': priceUnit,
    //     "image": image,
    //     "sku": sku,
    //   };
    // }
    state = StockOrderingState.checkOut(mergedMap);
    state = StockOrderingState.addOrder(mutableOrderLines);
    state = StockOrderingState.incrementStockOrderQty(mutableQtyMap);
    Map<String, List<Map<String, dynamic>>> dkmfdfj = await retrieveOrderData();
    superPrint("Local Storage :::: $dkmfdfj");
  }

  decrementTotalQty(
    int vendorId,
    String vendorName,
    Map<int, int> qtyMap,
    List<Map<String, dynamic>> orderLineMap,
    Map<String, List<Map<String, dynamic>>> checkOutDataMap,
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

  clearTotalQty(StockOrder stockOrder) {
    state = StockOrderingState.clearTotalQty({stockOrder.id: 1});
  }

  Future<void> storeOrderData(
      Map<String, List<Map<String, dynamic>>> checkOutMap) async {
    try {
      String jsonData = jsonEncode(
          {for (var entry in checkOutMap.entries) entry.key: entry.value});
      await _sharedPreferences.setString(AppKeys.orderForm, jsonData);
      print("Data stored successfully.");
    } catch (e) {}
  }

  Future<Map<String, List<Map<String, dynamic>>>> retrieveOrderData() async {
    String? jsonString = _sharedPreferences.getString(AppKeys.orderForm);
    if (jsonString == null) {
      return {};
    }
    Map<String, dynamic> decodedMap = jsonDecode(jsonString);
    return {
      for (var entry in decodedMap.entries)
        entry.key: List<Map<String, dynamic>>.from(entry.value as List)
    };
  }

  addProductToCart(Map<String, List<Map<String, dynamic>>> mergedMap) async {
    state = StockOrderingState.checkOut(mergedMap);
    await storeOrderData(mergedMap);
  }

  showAllOrderFormData() async {
    Map<String, List<Map<String, dynamic>>> storageOrderFormData =
        await retrieveOrderData();
    superPrint("Add Local Storage :::: $storageOrderFormData");
    state = StockOrderingState.backupCheckOut(storageOrderFormData);
  }

  clearAllOrderForm() async {
    _sharedPreferences.remove(AppKeys.orderForm);
    showAllOrderFormData();
    state = const StockOrderingState.checkOut({});
    state = const StockOrderingState.addOrder([]);
    state = const StockOrderingState.incrementStockOrderQty({});
  }
}
