import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../domain/return_request_reason.dart';
import '../my_request_repository.dart';
import '../state/return_request_reason_state.dart';

class ReturnRequestReasonStateNotifier
    extends StateNotifier<ReturnRequestReasonState> {
  ReturnRequestReasonStateNotifier(this._myRequestRepository)
      : super(const ReturnRequestReasonState.initial());
  final MyRequestRepository _myRequestRepository;

  List<ReturnRequestReason> returnRequestReasonList = [];

  Future<void> getOutletRejectReason() async {
    try {
      state = const ReturnRequestReasonState.loading();
      returnRequestReasonList.clear();
      Response response = await _myRequestRepository.returnRequestReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        returnRequestReasonList.add(ReturnRequestReason.fromJson(element));
      }
      state = ReturnRequestReasonState.loadReturnRequestReason(
          returnRequestReasonList);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
