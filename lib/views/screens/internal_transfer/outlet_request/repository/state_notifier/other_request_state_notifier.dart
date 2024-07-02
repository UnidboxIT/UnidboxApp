import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/other_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/other_request_state.dart';

import '../../../../../../utils/commons/super_print.dart';
import '../../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';

class OtherRequestStateNotifier extends StateNotifier<OtherRequestState> {
  OtherRequestStateNotifier(this._otherRequestRepository)
      : super(const OtherRequestState.initial());

  final OtherRequestRepository _otherRequestRepository;
  List<OtherRequest> otherRequestList = [];

  Future<void> getAllOtherRequest() async {
    try {
      state = const OtherRequestState.loading();
      otherRequestList.clear();
      Response response = await _otherRequestRepository.otherRequest();
      //  superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        otherRequestList.add(OtherRequest.fromJson(element));
      }
      state = OtherRequestState.loadOtherRequestData(otherRequestList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  // clearMyRequestValue() {
  //   otherRequestList.clear();
  // }

  Future<void> acceptOtherRequest(
      int productID, double qty, BuildContext context) async {
    try {
      state = const OtherRequestState.acceptLoading();
      state = OtherRequestState.acceptProductID(productID);
      Response response =
          await _otherRequestRepository.accepted(productID, qty);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllOtherRequest();
        } else {
          CommonMethods.customizedAlertDialog(
              result['result']['message'], context);
          state = const OtherRequestState.error();
        }
      } else if (result.containsKey('error')) {
        CommonMethods.customizedAlertDialog(
            result['error']['message'], context);
        state = const OtherRequestState.error();
      }
    } catch (e) {
      superPrint(e.toString());
      state = const OtherRequestState.error();
    }
  }

  Future<void> packOtherRequest(
      int productID, double qty, BuildContext context) async {
    try {
      state = const OtherRequestState.acceptLoading();
      state = OtherRequestState.acceptProductID(productID);
      Response response = await _otherRequestRepository.packed(productID, qty);
      var result = jsonDecode(response.body);
      superPrint(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllOtherRequest();
        } else {
          CommonMethods.customizedAlertDialog(
              result['result']['message'], context);
          state = const OtherRequestState.error();
        }
      } else if (result.containsKey('error')) {
        CommonMethods.customizedAlertDialog(
            result['error']['message'], context);
        state = const OtherRequestState.error();
      }
    } catch (e) {
      superPrint(e.toString());
      state = const OtherRequestState.error();
    }
  }

  Future<void> deliveryOtherRequest(
      List<int> mainID, BuildContext context) async {
    try {
      state = const OtherRequestState.acceptLoading();
      Response response = await _otherRequestRepository.issued(mainID);
      superPrint(response);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          successfullyBottomSheet(
              "Issued", "All Item had been handed over for delivery", () {
            // clearMyRequestValue();
            getAllOtherRequest();
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
    if (qty > 0) {
      qty--;
      state = OtherRequestState.decrementQty(productID, qty);
    }
  }

  bool productIdContainsQuery = false;
  searchOtherRequestData(String query) {
    if (query.isNotEmpty) {
      List<OtherRequest> searchRequest = otherRequestList.where((request) {
        final nameContainsQuery =
            request.name.toLowerCase().contains(query.toLowerCase());
        final userIdContainsQuery = request.userId[1]
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());

        for (var data in request.productLineList) {
          productIdContainsQuery = data.productIdList[1]
              .toString()
              .trim()
              .toLowerCase()
              .contains(query.toLowerCase());
          superPrint(data.productIdList[1]);
        }

        return nameContainsQuery ||
            userIdContainsQuery ||
            productIdContainsQuery;
      }).toList();
      state = OtherRequestState.searchOtherRequestValue(searchRequest);
    } else {
      getAllOtherRequest();
    }
  }
}
