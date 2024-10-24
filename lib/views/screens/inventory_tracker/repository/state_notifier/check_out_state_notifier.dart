import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../domain/stock_order.dart';
import '../../presentation/stock_ordering/check_out_order_detail_screen.dart';
import '../provider/stock_order_provider.dart';
import '../state/check_out_order_state.dart';

class CheckOutStateNotifier extends StateNotifier<CheckOutOrderState> {
  CheckOutStateNotifier(this._inventoryTrackerRepository)
      : super(const CheckOutOrderState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  Future<void> checkOutOrder(
      int companyID,
      int partnerId,
      List orderLine,
      BuildContext context,
      WidgetRef ref,
      StockOrder stockOrder,
      UserWarehouse userWarehouse,
      Products productDetail) async {
    try {
      state = const CheckOutOrderState.loading();
      Response response = await _inventoryTrackerRepository.checkout(
          companyID,
          partnerId,
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          orderLine);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['message'] == "success") {
        ref
            .read(stockOrderStateNotifierProvider.notifier)
            .clearTotalQty(stockOrder);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CheckOutOrderDetailScreen(
              productDetail: productDetail,
            ),
          ),
        );
        state =
            CheckOutOrderState.success(result['result']['message'].toString());
        // });
      } else {
        successfullyBottomSheet("Order Submitted Fail!", result['message'], () {
          Navigator.of(context).pop();
        }, context);
        state = const CheckOutOrderState.error(error: "Fail");
      }
    } catch (e) {
      state = CheckOutOrderState.error(error: e.toString());
      superPrint(e);
    }
  }
}
