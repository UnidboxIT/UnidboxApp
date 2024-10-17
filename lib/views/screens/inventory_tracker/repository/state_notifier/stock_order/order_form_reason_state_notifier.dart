import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../internal_transfer/outlet_request/domain/outlet_reject_reason.dart';
import '../../state/stock_order/order_form_reason_state.dart';

class OrderFormReasonStateNotifier extends StateNotifier<OrderFormReasonState> {
  OrderFormReasonStateNotifier(this._inventoryTrackerRepository)
      : super(const OrderFormReasonState.initial());
  final InventoryTrackerRepository _inventoryTrackerRepository;
  List<ReasonsData> orderFormReasonList = [];

  Future<void> getOrderFormReason() async {
    try {
      state = const OrderFormReasonState.loading();
      orderFormReasonList.clear();
      Response response = await _inventoryTrackerRepository.orderFormReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        orderFormReasonList.add(ReasonsData.fromJson(element));
      }
      state = OrderFormReasonState.loadOrderFormReason(orderFormReasonList
          .where((e) => e.option == "other" && e.purchase == true)
          .toList());
    } catch (e) {
      superPrint(e.toString());
    }
  }

  incrementOrderFormQty(Map<String, int> qty, String purchaseID) {
    Map<String, int> mutableQtyMap = Map.from(qty);
    if (qty.containsKey(purchaseID)) {
      mutableQtyMap[purchaseID] = mutableQtyMap[purchaseID]! + 1;
    } else {
      mutableQtyMap[purchaseID] = 2;
    }
    state = OrderFormReasonState.incrementOrderFormQty(mutableQtyMap);
  }

  decrementOrderFormQty(Map<String, int> qty, String purchaseID) {
    Map<String, int> mutableQtyMap = Map.from(qty);
    if (qty.containsKey(purchaseID)) {
      if (mutableQtyMap[purchaseID]! > 1) {
        mutableQtyMap[purchaseID] = mutableQtyMap[purchaseID]! - 1;
      }
    }
    state = OrderFormReasonState.decrementOrderFormQty(mutableQtyMap);
  }

  addOrderFormReason(String productID, reason, Map<String, dynamic> reasonMap) {
    Map<String, dynamic> mutableReasonMap = Map.from(reasonMap);
    if (mutableReasonMap.containsKey(productID)) {
      // Update the value if it exists
      mutableReasonMap[productID] = reason;
    } else {
      // Create a new entry if it doesn't exist
      mutableReasonMap[productID] = reason;
    }
    superPrint(mutableReasonMap);
    state =
        OrderFormReasonState.selectedOrderFormReturnReason(mutableReasonMap);
  }

  orderFormSubmit() {}
}
