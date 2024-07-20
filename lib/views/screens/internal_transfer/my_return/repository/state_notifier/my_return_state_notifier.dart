import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/domain/return_request_reason.dart';
import '../my_return_repository.dart';
import '../state/my_return_state.dart';

class MyReturnStateNotifier extends StateNotifier<MyReturnState> {
  MyReturnStateNotifier(this._myRequestRepository)
      : super(const MyReturnState.initial());

  final MyReturnRepository _myRequestRepository;
  List<MyRequest> myReturnList = [];
  List<ReturnRequestReason> returnRequestReasonList = [];

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
      superPrint(response.body);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> updateMyReturn(
    int currentWarehouseID,
    int requestWarehouseID,
    int productID,
    String productName,
    int totalQty,
    double price,
    int uomID,
    List<int> reasonIDList,
    String comment,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      state = const MyReturnState.updateLoading();
      Response response = await _myRequestRepository.myReturnStockRequest(
          currentWarehouseID,
          requestWarehouseID,
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
}
