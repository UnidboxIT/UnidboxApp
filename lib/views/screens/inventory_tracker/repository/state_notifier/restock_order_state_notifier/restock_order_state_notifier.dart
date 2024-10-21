import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/restock_order_state/restock_order_state.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';

class RestockOrderStateNotifier extends StateNotifier<RestockOrderState> {
  RestockOrderStateNotifier(this._inventoryTrackerRepository)
      : super(const RestockOrderState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  Future<void> restockOrder(
    BuildContext context,
    int productID,
    int productUom,
    int minQty,
    int warehouseID,
  ) async {
    try {
      state = const RestockOrderState.loading();
      Response response = await _inventoryTrackerRepository.restockOrder(
        productID,
        productUom,
        minQty,
        warehouseID,
      );
      superPrint(response.body);
      var result = jsonDecode(response.body);
      superPrint(result);

      if (result['result']['message'] == "success") {
        successfullyBottomSheet("Auto Restock Confirmed",
                "Restock details will be auto send to\ndefault vendor", () {
          Navigator.of(context).pop();
        }, context)
            .then((_) {
          Navigator.of(context).pop();
        });
        state = RestockOrderState.success(
            success: result['result']['message'].toString());
      } else {
        successfullyBottomSheet("Auto Restock Confirmed", result['message'],
            () {
          Navigator.of(context).pop();
        }, context);
        state = RestockOrderState.error(error: result['message'].toString());
      }
    } catch (e) {
      state = RestockOrderState.error(error: e.toString());
      superPrint(e);
    }
  }

  Future<void> getReorder(int productID, int userWarehouseID) async {
    try {
      state = const RestockOrderState.loading();
      Response response = await _inventoryTrackerRepository.restockOrderByID(
          productID, userWarehouseID);
      superPrint(response.body);
      var result = jsonDecode(response.body);

      result['result']['records'][0]['product_max_qty'];
      superPrint(result['result']['records'][0]['product_max_qty']);
      superPrint(result['result']['records'][0]['product_min_qty']);
      state = RestockOrderState.minMaxRestockQty(
          result['result']['records'][0]['product_min_qty'],
          result['result']['records'][0]['product_max_qty']);

      // if (result['result']['message'] == "success") {
      //   state = RestockOrderState.success(
      //       success: result['result']['message'].toString());
      // } else {
      //   state = RestockOrderState.error(error: result['message'].toString());
      // }
    } catch (e) {
      state = RestockOrderState.error(error: e.toString());
      superPrint(e);
    }
  }

  restockIncremetQty(int qty) {
    qty++;
    state = RestockOrderState.incrementRestockOrder(qty);
  }

  restockDecrementQty(int qty) {
    if (qty > 1) {
      qty--;
      state = RestockOrderState.decremenRestockOrder(qty);
    }
  }

  setTextFieldWhValue(int qty) {
    state = RestockOrderState.setResotckTextFieldValue(qty);
  }
}
