import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/order_receiving/domain/order_receiving.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/order_receiving_repository.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state/pending_receiving_state.dart';

import '../../../../../utils/commons/super_print.dart';

class PendingReceivingStateNotifier
    extends StateNotifier<PendingReceivingState> {
  PendingReceivingStateNotifier(this._orderReceivingRepository)
      : super(const PendingReceivingState.initial());
  final OrderReceivingRepository _orderReceivingRepository;
  List<OrderReceiving> pendingOrderList = [];
  OrderReceivingDetail orderReceivingDetail = OrderReceivingDetail();
  Future<void> getAllPendingReceiving(String status) async {
    if (pendingOrderList.isEmpty) {
      state = const PendingReceivingState.loading();
    }
    try {
      Response response =
          await _orderReceivingRepository.pendingReceiving(status);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      pendingOrderList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        pendingOrderList.add(OrderReceiving.fromJson(element));
      }
      state = PendingReceivingState.loadPendingReceivingData(pendingOrderList);
      superPrint(response.body);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> receiveByIDWithDone(int purchaseID, List receivedLine,
      String fileName, String base64Image) async {
    state = const PendingReceivingState.loading();
    try {
      Response response = await _orderReceivingRepository.receiveByID(
        purchaseID,
        receivedLine,
        fileName,
        base64Image,
      );
      superPrint(response.body);

      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllPendingReceiving("purchase");
          state = const PendingReceivingState.success();
        } else {
          state = const PendingReceivingState.error();
        }
      } else {
        state = const PendingReceivingState.error();
      }
    } catch (e) {
      state = const PendingReceivingState.error();
      superPrint(e.toString());
    }
  }

  Future<void> getReceiveDetailByID(int purchaseID) async {
    try {
      Response response =
          await _orderReceivingRepository.getReceiveByID(purchaseID);
      superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          superPrint(result['result']['records'][0]);
          orderReceivingDetail = OrderReceivingDetail.fromJson(dataList.first);
          superPrint(orderReceivingDetail);
        } else {}
      } else {}
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
