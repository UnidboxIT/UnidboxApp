import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/outlet_reject_reason.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../my_return_repository.dart';
import '../state/my_return_reason_state.dart';

class MyReturnReasonStateNotifier extends StateNotifier<MyReturnReasonState> {
  MyReturnReasonStateNotifier(this._myReturnRepository)
      : super(const MyReturnReasonState.initial());
  final MyReturnRepository _myReturnRepository;

  List<ReasonsData> returnRequestReasonList = [];

  Future<void> getAllMyReturnReason() async {
    try {
      state = const MyReturnReasonState.loading();
      returnRequestReasonList.clear();
      Response response = await _myReturnRepository.returnRequestReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        returnRequestReasonList.add(ReasonsData.fromJson(element));
      }
      state = MyReturnReasonState.loadReturnRequestReason(
          returnRequestReasonList
              .where((e) =>
                  e.option == "false" &&
                  e.newRequest == true &&
                  e.reject == false)
              .toList());
    } catch (e) {
      superPrint(e.toString());
    }
  }
  //myReturnStateNotifierProvider
}
