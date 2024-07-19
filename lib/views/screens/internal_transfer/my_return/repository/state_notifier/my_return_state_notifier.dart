import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../my_request/domain/my_request.dart';
import '../my_return_repository.dart';
import '../state/my_return_state.dart';

class MyReturnStateNotifier extends StateNotifier<MyReturnState> {
  MyReturnStateNotifier(this._myRequestRepository)
      : super(const MyReturnState.initial());

  final MyReturnRepository _myRequestRepository;
  List<MyRequest> myReturnList = [];
  Future<void> getAllMyReturn() async {
    try {
      // state = const MyRequestState.loading();
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
}
