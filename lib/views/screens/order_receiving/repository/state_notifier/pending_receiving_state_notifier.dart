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
  Future<void> getAllPendingReceiving() async {
    state = const PendingReceivingState.loading();
    try {
      Response response = await _orderReceivingRepository.pendingReceiving();
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

  Future<void> receiveByID(int purchaseID, List receivedLine) async {
    state = const PendingReceivingState.loading();
    try {
      Response response =
          await _orderReceivingRepository.receiveByID(purchaseID, receivedLine);
      superPrint(response.body);

      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAllPendingReceiving();
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
}
