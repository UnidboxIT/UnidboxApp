import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
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
  String localFilePath = "";
  List<StockOrder> stockOrderList = [];
  List<OrderReceiving> orderFormList = [];

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
          //viewPurchasePdfFile(context, result['result']['id'][0]);
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

  Future<void> viewPurchasePdfFile(
      BuildContext context, String purchaseOrderID) async {
    try {
      state = const StockOrderingState.loading();
      Response response =
          await _inventoryTrackerRepository.pdfViewPurchase(purchaseOrderID);
      String decodedString = String.fromCharCodes(response.bodyBytes);
      print(decodedString);

      // String jsonString = utf8.decode(response.bodyBytes);
      // var jsonData = jsonDecode(jsonString);
      // String base64Image = jsonData['image'];
      // Uint8List imageBytes = base64Decode(base64Image);
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) =>
      //         PurchaseOrderPdfViewScreen(imageUrl: imageBytes)));
      // superPrint(result);
      // if (response.statusCode == 200) {
      //   final dir = await getApplicationDocumentsDirectory();
      //   String jsonString = utf8.decode(response.bodyBytes);
      //   superPrint("JSON string: $jsonString");
      //   final pdf = pw.Document();
      //   pdf.addPage(
      //     pw.Page(
      //       build: (pw.Context context) => pw.Center(
      //         child: pw.Text(jsonString),
      //       ),
      //     ),
      //   );
      //   superPrint(pdf);
      //   final pdfFile = File('${dir.path}/generated_purchase_order.pdf');
      //   await pdfFile.writeAsBytes(await pdf.save());
      //   superPrint("Generated PDF saved at: ${pdfFile.path}");
      //   localFilePath = pdfFile.path;
      //   // Navigator.of(context).push(MaterialPageRoute(
      //   //     builder: (context) =>
      //   //         PurchaseOrderPdfViewScreen(filePath: localFilePath)));
      //   state = const StockOrderingState.success("Success");
      // } else {
      //   state = const StockOrderingState.error(error: 'Failed to load PDF.');
      // }
    } catch (e) {
      state = StockOrderingState.error(error: e.toString());
      superPrint(e.toString());
    }
  }

  clearTotalQty(StockOrder stockOrder) {
    state = StockOrderingState.clearTotalQty({stockOrder.id: 1});
  }
}
