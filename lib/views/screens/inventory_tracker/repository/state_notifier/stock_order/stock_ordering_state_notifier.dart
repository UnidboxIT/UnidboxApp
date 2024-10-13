import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/stock_order.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../../auth/repository/auth_state_notifier.dart';
import '../../../../order_receiving/domain/order_receiving.dart';
import '../../../presentation/stock_ordering/purchase_order_pdf_view_screen.dart';
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

  Future<void> submitPurchaseOrder(
      BuildContext context, List<int> purchaseOrderID) async {
    try {
      state = const StockOrderingState.loading();
      Response response =
          await _inventoryTrackerRepository.orderFormSubmit(purchaseOrderID);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      // Iterable dataList = result['result']['records'];
      if (result['result']['code'] == 200) {
        successfullyBottomSheet(
            "Order Submitted!", "Find order in delivery orders", () {
          viewPurchasePdfFile(context,result['result']['id'][0]);
          Navigator.of(context).pop();
          getAllOrderForm();
        }, context);
        state =
            StockOrderingState.success(result['result']['message'].toString());
      } else {
        successfullyBottomSheet("Order Submitted Fail!", result['message'], () {
          Navigator.of(context).pop();
        }, context);
        state = StockOrderingState.error(
            error: result['result']['message'].toString());
      }
    } catch (e) {
      state = StockOrderingState.error(error: e.toString());
      superPrint(e.toString());
    }
  }
  String localFilePath="";
  Future<void> viewPurchasePdfFile(BuildContext context,String purchaseOrderID) async {
    try {
      state = const StockOrderingState.loading();
      Response response =
          await _inventoryTrackerRepository.pdfViewPurchase(purchaseOrderID);
superPrint(response.headers);
      final contentType = response.headers['content-type'];
      superPrint(contentType);
        if (response.statusCode == 200) {
          if (contentType != null && contentType.contains('application/pdf')) {
            final dir = await getApplicationDocumentsDirectory();
            final file = File('${dir.path}/purchase_order.pdf');
            await file.writeAsBytes(response.bodyBytes);
            localFilePath = file.path;
            superPrint(localFilePath);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                PurchaseOrderPdfViewScreen(filePath: localFilePath)));
          } else{
          final Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));
          superPrint(jsonResponse['error']['message'] ?? 'Unknown error');
          }
        }
        state =const StockOrderingState.success("Success");
    } catch (e) {
      state = StockOrderingState.error(error: e.toString());
      superPrint(e.toString());
    }
  }

  clearTotalQty(StockOrder stockOrder) {
    state = StockOrderingState.clearTotalQty({stockOrder.id: 1});
  }
}
