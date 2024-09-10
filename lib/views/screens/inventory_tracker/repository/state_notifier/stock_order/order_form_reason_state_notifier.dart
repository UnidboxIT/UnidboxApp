import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../internal_transfer/my_request/domain/return_request_reason.dart';
import '../../state/stock_order/order_form_reason_state.dart';

class OrderFormReasonStateNotifier extends StateNotifier<OrderFormReasonState> {
  OrderFormReasonStateNotifier(this._inventoryTrackerRepository)
      : super(const OrderFormReasonState.initial());
  final InventoryTrackerRepository _inventoryTrackerRepository;
  List<ReturnRequestReason> orderFormReasonList = [];

  Future<void> getOutletRejectReason() async {
    try {
      state = const OrderFormReasonState.loading();
      orderFormReasonList.clear();
      Response response = await _inventoryTrackerRepository.orderFormReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        orderFormReasonList.add(ReturnRequestReason.fromJson(element));
      }
      state = OrderFormReasonState.loadOrderFormReason(orderFormReasonList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  incrementOrderFormQty(String productID, int qty) {
    qty = qty + 1;
    state = OrderFormReasonState.incrementQty(productID, qty);
  }

  decrementOrderFormQty(String productID, int qty) {
    if (qty > 1) {
      qty--;
      state = OrderFormReasonState.decrementQty(productID, qty);
    }
  }
}
