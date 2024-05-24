import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/stock_request_state.dart';
import '../../../utils/commons/super_print.dart';
import '../../../views/widgets/bottom_sheets/successfully_bottom_sheet.dart';

class StockRequestStateNotifier extends StateNotifier<StockRequestState> {
  StockRequestStateNotifier(this._inventoryTrackerRepository)
      : super(const StockRequestState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  Future<void> requestInHouseStock(
      int currentWarehouseID,
      int requestWarehouseID,
      int companyID,
      int productID,
      String productName,
      int totalQty,
      double price,
      int uomID,
      BuildContext context) async {
    try {
      state = const StockRequestState.loading();
      Response response = await _inventoryTrackerRepository.stockRequest(
          currentWarehouseID,
          requestWarehouseID,
          companyID,
          productID,
          productName,
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          totalQty,
          price,
          uomID);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['code'] == 200) {
        state =
            StockRequestState.success(result['result']['message'].toString());
        successfullyBottomSheet(
                "Request Sent!", "Check status under pending requests", () {
          Navigator.of(context).pop();
        }, context)
            .then((_) {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      state = StockRequestState.error(error: e.toString());
      superPrint(e);
    }
  }
}
