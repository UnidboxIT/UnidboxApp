import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/my_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';

import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';

class MyRequestStateNotifier extends StateNotifier<MyRequestState> {
  MyRequestStateNotifier(this._myRequestRepository)
      : super(const MyRequestState.initial());

  final MyRequestRepository _myRequestRepository;
  List<MyRequest> myRequestList = [];

  Future<void> getAllMyRequest() async {
    try {
      // state = const MyRequestState.loading();
      Response response = await _myRequestRepository.myrequest();
      var result = jsonDecode(response.body);
      myRequestList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        myRequestList.add(MyRequest.fromJson(element));
      }

      state = MyRequestState.loadMyRequestData(myRequestList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> doneMyRequest(
      int productID, int qty, BuildContext context) async {
    try {
      state = const MyRequestState.loading();
      Response response = await _myRequestRepository.done(productID, qty);
      superPrint(response);
      var result = jsonDecode(response.body);
      superPrint(result);
      getAllMyRequest();
      state = MyRequestState.receivedProductID(productID);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> receivedByImageMyRequest(int productID, int qty,
      BuildContext context, String image, String productName) async {
    try {
      state = const MyRequestState.loading();
      Response response = await _myRequestRepository.receivedByImage(
          productID, qty, image, productName);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllMyRequest();
          Navigator.of(context).pop();
        }
      } else if (result.containsKey('error')) {
        CommonMethods.customizedAlertDialog(
            result['error']['message'], context);
      }
      superPrint(response.body);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  incrementTotalQty(int productID, double qty) {
    qty = qty + 1;
    state = MyRequestState.incrementQty(productID, qty);
  }

  decrementTotalQty(int productID, double qty) {
    if (qty >= 1) {
      qty--;
      state = MyRequestState.decrementQty(productID, qty);
    }
  }
}
