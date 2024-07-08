import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_request_state.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../../../widgets/bottom_sheets/stock_request_bottom_sheet.dart';
import '../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../internal_transfer/my_request/presentation/my_requests_detail_screen.dart';
import '../../../internal_transfer/my_request/presentation/pending_request_list_screen.dart';

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
      bool isUrgent,
      BuildContext context,
      {bool isBackReques = false}) async {
    state = const StockRequestState.loading();
    try {
      Response response = await _inventoryTrackerRepository.stockRequest(
          currentWarehouseID,
          requestWarehouseID,
          companyID,
          productID,
          productName,
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          totalQty,
          price,
          uomID,
          isUrgent);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          state = StockRequestState.success(
            result['result']['message'].toString(),
          );
          stockRequestSuccessBottomSheet(
            "Request Sent!",
            "Check status under pending requests",
            () {
              if (isBackReques) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
            () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const PendingRequestListScreen()))
                  .then((_) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const MyRequestsDetailScreen(
                              isStockRequest: true,
                            )),
                    (route) => route.isFirst);
              });
            },
            context,
          );
          // successfullyBottomSheet(
          //   "Request Sent!",
          //   "Check status under pending requests",
          //   () {
          //     Navigator.of(context).pop();
          //   },
          //   context,
          // ).then((_) {
          //   Navigator.of(context).pop();
          // });
        } else {
          successfullyBottomSheet("Request Sent Fail!", "Something wrong!", () {
            Navigator.of(context).pop();
          }, isFail: true, context);
          superPrint("Here");
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
        }
      }
      state = const StockRequestState.sendRequestSuccess();
    } catch (e) {
      state = StockRequestState.error(error: e.toString());
      superPrint(e);
    }
  }
}
