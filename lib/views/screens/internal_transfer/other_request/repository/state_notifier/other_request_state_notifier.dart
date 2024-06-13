import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/other_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/other_request_state.dart';

import '../../../../../../utils/commons/super_print.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';

class OtherRequestStateNotifier extends StateNotifier<OtherRequestState> {
  OtherRequestStateNotifier(this._otherRequestRepository)
      : super(const OtherRequestState.initial());

  final OtherRequestRepository _otherRequestRepository;
  List<OtherRequest> otherRequestList = [];

  Future<void> getAllOtherRequest(int offset) async {
    try {
      if (otherRequestList.isEmpty) {
        state = const OtherRequestState.loading();
      }

      Response response = await _otherRequestRepository.otherRequest(offset);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        otherRequestList.add(OtherRequest.fromJson(element));
      }

      state = OtherRequestState.loadOtherRequestData(otherRequestList);
      if (dataList.isEmpty) {
        state = const OtherRequestState.isDataExist(false);
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  clearMyRequestValue() {
    otherRequestList.clear();
  }

  Future<void> acceptOtherRequest(int productID, int offset) async {
    try {
      state = const OtherRequestState.acceptLoading();
      Response response = await _otherRequestRepository.accepted(productID);
      var result = jsonDecode(response.body);
      superPrint(result);
      clearMyRequestValue();
      getAllOtherRequest(offset);
      state = OtherRequestState.acceptProductID(productID);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> packOtherRequest(int productID, double qty) async {
    try {
      state = const OtherRequestState.acceptLoading();
      Response response = await _otherRequestRepository.packed(productID, qty);
      var result = jsonDecode(response.body);
      superPrint(result);
      clearMyRequestValue();
      getAllOtherRequest(0);
      state = OtherRequestState.acceptProductID(productID);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> deliveryOtherRequest(
      List<int> mainID, BuildContext context) async {
    try {
      state = const OtherRequestState.acceptLoading();
      Response response = await _otherRequestRepository.delivery(mainID);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          successfullyBottomSheet(
              "Issued", "All Item had been handed over for delivery", () {
            clearMyRequestValue();
            getAllOtherRequest(0);
            Navigator.of(context).pop();
          }, context);
        }
      } else if (result.containsKey('error')) {
        CommonMethods.customizedAlertDialog(
            result['error']['message'], context);
      }
      // state = OtherRequestState.acceptProductID(productID);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  incrementTotalQty(int productID, double qty) {
    qty = qty + 1;
    state = OtherRequestState.incrementQty(productID, qty);
  }

  decrementTotalQty(int productID, double qty) {
    if (qty > 1) {
      qty--;
      state = OtherRequestState.decrementQty(productID, qty);
    }
  }
}
