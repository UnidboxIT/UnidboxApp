import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../auth/repository/auth_state_notifier.dart';
import '../../../../order_receiving/domain/order_receiving.dart';
import '../../state/stock_order/stock_ordering_state.dart';

class StockOrderingStateNotifier extends StateNotifier<StockOrderingState> {
  StockOrderingStateNotifier(this._inventoryTrackerRepository)
      : super(const StockOrderingState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<StockOrder> stockOrderList = [];
  Future<void> getStockOrder(
      int productID, WidgetRef ref, BuildContext context) async {
    try {
      state = const StockOrderingState.loading();
      Response response =
          await _inventoryTrackerRepository.stockOrder(productID);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          stockOrderList.clear();
          for (var data in dataList) {
            stockOrderList.add(StockOrder.fromJson(data));
          }
          state = StockOrderingState.loadStockOrdering(stockOrderList);
        }
      } else if (result.containsKey('error')) {
        if (result['error']['code'] == 100) {
          ref
              .read(authStateNotifierControllerProvider.notifier)
              .logout(context, ref);
        } else {
          CommonMethods.customizedAlertDialog(
              result['error']['message'], context);
        }
      }
    } catch (e) {
      state = StockOrderingState.error(error: e.toString());
      superPrint(e);
    }
  }

  List<OrderReceiving> orderFormList = [];
  Future<void> getAllOrderForm() async {
    state = const StockOrderingState.loading();
    try {
      Response response = await _inventoryTrackerRepository.orderForm();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      orderFormList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        orderFormList.add(OrderReceiving.fromJson(element));
      }
      state = StockOrderingState.loadPendingReceivingData(orderFormList);
      superPrint(response.body);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  // incrementTotalQty(
  //   int vendorId,
  //   String vendorName,
  //   Map<int, int> qtyMap,
  //   Map<String, List<Map<String, dynamic>>> orderFormValueMap,
  //   int productID,
  //   String productName,
  //   int uomID,
  //   double priceUnit,
  //   String image,
  //   String sku,
  // ) async {
  //   //increment qty
  //   Map<int, int> mutableQtyMap = Map.from(qtyMap);
  //   superPrint(mutableQtyMap);
  //   if (qtyMap.containsKey(vendorId)) {
  //     mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! + 1;
  //   } else {
  //     mutableQtyMap[vendorId] = 1;
  //   }
  //   superPrint(orderFormValueMap);
  //   Map<String, List<Map<String, dynamic>>> storageDataMap =
  //       await retrieveOrderFormDataList();
  //   superPrint("Local Storage :::: $storageDataMap");
  //   /**
  //    * Add Order Form Product in Map
  //    */
  //   Map<String, List<Map<String, dynamic>>> mergedOrderFromMap =
  //       Map.from(storageDataMap);
  //   Map<String, dynamic> newProductEntry = {
  //     'product_id': productID,
  //     'name': productName,
  //     'product_qty': mutableQtyMap[vendorId],
  //     'product_uom': uomID,
  //     'price_unit': priceUnit,
  //     'image': image,
  //     'sku': sku,
  //   };
  //   // Check if vendorName already exists in the map
  //   if (mergedOrderFromMap.containsKey(vendorName)) {
  //     List<Map<String, dynamic>> existingProducts =
  //         mergedOrderFromMap[vendorName]!;
  //     bool productExists = false;
  //     for (var product in existingProducts) {
  //       if (product['product_id'] == productID) {
  //         product['product_qty'] = mutableQtyMap[vendorId];
  //         productExists = true;
  //         break;
  //       }
  //     }
  //     // If the product does not exist, add it to the list
  //     if (!productExists) {
  //       existingProducts.add(newProductEntry);
  //     }
  //   } else {
  //     // Vendor doesn't exist, so create a new entry for this vendor
  //     mergedOrderFromMap[vendorName] = [newProductEntry];
  //   }
  //   superPrint(mergedOrderFromMap);
  //   //  state = StockOrderingState.checkOut(mergedOrderFromMap);
  //   state = StockOrderingState.incrementStockOrderQty(mutableQtyMap);
  // }

  // decrementTotalQty(
  //   int vendorId,
  //   String vendorName,
  //   Map<int, int> qtyMap,
  //   Map<String, List<Map<String, dynamic>>> orderFormValueMap,
  //   int productID,
  //   String productName,
  //   int uomID,
  //   double priceUnit,
  //   String image,
  //   String sku,
  // ) async {
  //   Map<int, int> mutableQtyMap = Map.from(qtyMap);
  //   if (qtyMap.containsKey(vendorId)) {
  //     if (mutableQtyMap[vendorId]! >= 1) {
  //       mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! - 1;
  //     }
  //   } else {
  //     mutableQtyMap[vendorId] = -1;
  //   }

  //   /**
  //    * Add Order Form Product in Map
  //    */
  //   Map<String, List<Map<String, dynamic>>> storageDataMap =
  //       await retrieveOrderFormDataList();
  //   Map<String, dynamic> newProductEntry = {
  //     'product_id': productID,
  //     'name': productName,
  //     'product_qty': mutableQtyMap[vendorId],
  //     'product_uom': uomID,
  //     'price_unit': priceUnit,
  //     'image': image,
  //     'sku': sku,
  //   };

  //   Map<String, List<Map<String, dynamic>>> mergedOrderFromMap =
  //       Map.from(storageDataMap);
  //   // Check if vendorName already exists in the map
  //   if (mergedOrderFromMap.containsKey(vendorName)) {
  //     List<Map<String, dynamic>> existingProducts =
  //         mergedOrderFromMap[vendorName]!;
  //     bool productExists = false;
  //     for (var product in existingProducts) {
  //       if (product['product_id'] == productID) {
  //         product['product_qty'] = mutableQtyMap[vendorId];
  //         productExists = true;
  //         break;
  //       }
  //     }
  //     // If the product does not exist, add it to the list
  //     if (!productExists) {
  //       existingProducts.add(newProductEntry);
  //     }
  //   } else {
  //     // Vendor doesn't exist, so create a new entry for this vendor
  //     mergedOrderFromMap[vendorName] = [newProductEntry];
  //   }
  //   //state = StockOrderingState.checkOut(mergedOrderFromMap);
  //   state = StockOrderingState.decremenStockOrderQty(mutableQtyMap);
  // }

  clearTotalQty(StockOrder stockOrder) {
    state = StockOrderingState.clearTotalQty({stockOrder.id: 1});
  }

  // Future<void> storeOrderFormDataList(
  //     Map<String, List<Map<String, dynamic>>> checkOutMap) async {
  //   String jsonData = jsonEncode(
  //       {for (var entry in checkOutMap.entries) entry.key: entry.value});
  //   await _sharedPreferences.setString(AppKeys.orderForm, jsonData);
  //   superPrint("Data stored successfully.");
  // }

  // Future<Map<String, List<Map<String, dynamic>>>>
  //     retrieveOrderFormDataList() async {
  //   String? jsonString = _sharedPreferences.getString(AppKeys.orderForm);
  //   if (jsonString == null) {
  //     return {};
  //   }
  //   Map<String, dynamic> decodedMap = jsonDecode(jsonString);
  //   return {
  //     for (var entry in decodedMap.entries)
  //       entry.key: List<Map<String, dynamic>>.from(entry.value as List)
  //   };
  // }

  // addProductToCart(Map<String, List<Map<String, dynamic>>> mergedMap) async {
  //   //  state = StockOrderingState.checkOut(mergedMap);
  //   await storeOrderFormDataList(mergedMap);
  // }

  // showAllOrderFormData() async {
  //   Map<String, List<Map<String, dynamic>>> storageOrderFormData =
  //       await retrieveOrderFormDataList();
  //   superPrint("Add Local Storage :::: $storageOrderFormData");
  //   state = StockOrderingState.backupCheckOut(storageOrderFormData);
  // }

  // clearAllOrderForm() async {
  //   _sharedPreferences.remove(AppKeys.orderForm);
  //   showAllOrderFormData();
  //   // state = const StockOrderingState.checkOut({});
  //   state = const StockOrderingState.incrementStockOrderQty({});
  // }
}
