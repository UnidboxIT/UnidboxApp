import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../my_request/domain/return_request_reason.dart';
import '../my_return_repository.dart';
import '../state/my_return_reason_state.dart';

class MyReturnReasonStateNotifier extends StateNotifier<MyReturnReasonState> {
  MyReturnReasonStateNotifier(this._myReturnRepository)
      : super(const MyReturnReasonState.initial());
  final MyReturnRepository _myReturnRepository;

  List<ReturnRequestReason> returnRequestReasonList = [];

  Future<void> getAllMyReturnReason() async {
    try {
      state = const MyReturnReasonState.loading();
      returnRequestReasonList.clear();
      Response response = await _myReturnRepository.returnRequestReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        returnRequestReasonList.add(ReturnRequestReason.fromJson(element));
      }
      state =
          MyReturnReasonState.loadReturnRequestReason(returnRequestReasonList);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
