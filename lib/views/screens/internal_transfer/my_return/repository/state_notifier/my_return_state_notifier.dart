import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../../../inventory_tracker/domain/product.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/domain/return_request_reason.dart';
import '../../presentation/make_new_my_return_screen.dart';
import '../my_return_repository.dart';
import '../state/my_return_state.dart';

class MyReturnStateNotifier extends StateNotifier<MyReturnState> {
  MyReturnStateNotifier(this._myRequestRepository)
      : super(const MyReturnState.initial());

  final MyReturnRepository _myRequestRepository;
  List<MyRequest> myReturnList = [];
  List<ReturnRequestReason> returnRequestReasonList = [];
  List<Products> scanProductList = [];
  List<Products> searchProductList = [];

  Future<void> getAllMyReturn() async {
    try {
      state = const MyReturnState.loading();
      Response response = await _myRequestRepository.myReturn();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      myReturnList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        myReturnList.add(MyRequest.fromJson(element));
      }
      state = MyReturnState.loadMyReturnData(myReturnList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> updateMyReturn(
    int requestWarehouseID,
    int currentWarehouseID,
    int productID,
    String productName,
    int totalQty,
    double price,
    int uomID,
    List<String> reasonIDList,
    String comment,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      state = const MyReturnState.updateLoading();
      Response response = await _myRequestRepository.myReturnStockRequest(
          requestWarehouseID,
          currentWarehouseID,
          productID,
          productName,
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          totalQty,
          price,
          uomID,
          reasonIDList,
          comment);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllMyReturn();
          state = const MyReturnState.successUpdateSuccess();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
          state = const MyReturnState.myReturnError();
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> scanProductByBarCode(
    String barcode,
    BuildContext context,
    int pageNumber,
  ) async {
    try {
      state = const MyReturnState.loading();
      scanProductList.clear();
      Response response =
          await _myRequestRepository.scanProduct(barcode, pageNumber);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        if (result['result']['length'] != 0) {
          for (var element in dataList) {
            scanProductList.add(Products.fromJson(element));
          }
          state = MyReturnState.loadScanProduct(scanProductList);
          Navigator.of(context).pop();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MakeNewMyReturnScreen(
                scanProductList: scanProductList,
              ),
            ),
          );
        } else {
          Navigator.of(context).pop();
          CommonMethods.customizedAlertDialog("No product found!", context);
          state = const MyReturnState.loadScanProduct([]);
          //state = const ScanProductState.error(error: "No product found!");
        }
      }
      superPrint(scanProductList.length);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> searchProduct(
    String name,
    BuildContext context,
    int pageNumber,
  ) async {
    superPrint(name);
    try {
      state = const MyReturnState.loading();
      Response response =
          await _myRequestRepository.searchProduct(name, pageNumber);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        searchProductList.clear();
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          searchProductList.add(Products.fromJson(element));
        }
        state = MyReturnState.loadSearchProduct(searchProductList);
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MakeNewMyReturnScreen(
              scanProductList: searchProductList,
            ),
          ),
        );
      } else {
        Navigator.of(context).pop();
        CommonMethods.customizedAlertDialog("No product found!", context);
        state = const MyReturnState.loadScanProduct([]);
        //state = const ScanProductState.error(error: "No product found!");
      }
      superPrint(searchProductList);
      superPrint(searchProductList.first.name);
      superPrint(searchProductList.length, title: "Search Product Length");
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> deliveryReturnIssued(
      List<int> mainID, BuildContext context) async {
    try {
      state = const MyReturnState.loading();
      Response response = await _myRequestRepository.returnIssued(mainID);
      superPrint(response);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          successfullyBottomSheet(
              "Issued", "All Item had been handed over for delivery", () {
            getAllMyReturn();
            Navigator.of(context).pop();
          }, context);
        } else {
          CommonMethods.customizedAlertDialog(
            result['result']['error'],
            context,
          );
          state = const MyReturnState.myReturnError();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
          state = const MyReturnState.myReturnError();
        }
      }

      // state = OtherRequestState.acceptProductID(productID);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
