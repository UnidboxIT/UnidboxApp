import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../utils/commons/super_print.dart';
import '../../../views/widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../state/check_out_order_state.dart';

class CheckOutStateNotifier extends StateNotifier<CheckOutOrderState> {
  CheckOutStateNotifier(this._inventoryTrackerRepository)
      : super(const CheckOutOrderState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List orderList = [];

  void addOrder(var orderLine) {
    orderList.add(orderLine);
  }

  Future<void> checkOutOrder(int companyID, int partnerId, List orderLine,
      BuildContext context) async {
    try {
      state = const CheckOutOrderState.loading();
      Response response = await _inventoryTrackerRepository.checkout(
          companyID,
          partnerId,
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          orderLine);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['code'] == 200) {
        state =
            CheckOutOrderState.success(result['result']['message'].toString());
        successfullyBottomSheet(
                "Request Sent!", "Check status under pending requests", () {
          Navigator.of(context).pop();
        }, context)
            .then((_) {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      state = CheckOutOrderState.error(error: e.toString());
      superPrint(e);
    }
  }
}
