import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/my_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../presentation/widgets/return_request_success_bottomsheet.dart';

class MyRequestStateNotifier extends StateNotifier<MyRequestState> {
  MyRequestStateNotifier(this._myRequestRepository)
      : super(const MyRequestState.initial());

  final MyRequestRepository _myRequestRepository;
  List<MyRequest> myRequestList = [];

  Future<void> getAllMyRequest() async {
    try {
      if (myRequestList.isEmpty) {
        state = const MyRequestState.myRequestDataLoading();
      }

      Response response = await _myRequestRepository.myrequest();
      var result = jsonDecode(response.body);
      superPrint(result);
      myRequestList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        myRequestList.add(MyRequest.fromJson(element));
      }
      state = MyRequestState.loadMyRequestData(myRequestList);
      superPrint(response.body);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> removeRejectProduct(int productID, BuildContext context) async {
    try {
      state = const MyRequestState.loading();
      state = MyRequestState.receivedProductID(productID);
      Response response = await _myRequestRepository.remove(productID);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllMyRequest();
        } else {
          CommonMethods.customizedAlertDialog(
            result['result']['error'],
            context,
          );
          state = const MyRequestState.error();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
          state = const MyRequestState.error();
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> doneMyRequest(
      int productID, int qty, BuildContext context) async {
    try {
      state = const MyRequestState.loading();
      state = MyRequestState.receivedProductID(productID);

      Response response = await _myRequestRepository.done(productID, qty);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllMyRequest();
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
        state = const MyRequestState.error();
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> pendingRequestUpdate(
      int productID, int qty, BuildContext context) async {
    try {
      state = MyRequestState.receivedProductID(productID);
      state = const MyRequestState.loading();
      Response response =
          await _myRequestRepository.requestUpdate(productID, qty);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllMyRequest();
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
        state = const MyRequestState.error();
      }
    } catch (e) {
      superPrint(e.toString());
      state = const MyRequestState.error();
    }
  }

  Future<void> receivedByImageMyRequest(
      int productID,
      int qty,
      BuildContext context,
      List reasonIdList,
      String otherComment,
      List imageList) async {
    try {
      state = const MyRequestState.loading();
      Response response = await _myRequestRepository.receivedByImage(
        productID,
        qty,
        reasonIdList,
        otherComment,
        imageList,
      );
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          returnRequestSuccessBottomSheet(() {
            getAllMyRequest();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }, context);
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
        state = const MyRequestState.error();
      }
      superPrint(response.body);
    } catch (e) {
      state = const MyRequestState.error();
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

  bool productIdContainsQuery = false;
  searchMyRequestData(String query) {
    superPrint(myRequestList);
    if (query.isNotEmpty) {
      List<MyRequest> searchRequest = myRequestList.where((request) {
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
          // superPrint(data.productIdList[1]);
        }

        return nameContainsQuery ||
            userIdContainsQuery ||
            productIdContainsQuery;
      }).toList();

      superPrint(searchRequest);
      state = MyRequestState.searchMyRequestValue(searchRequest);
    } else {
      getAllMyRequest();
    }
  }
}
