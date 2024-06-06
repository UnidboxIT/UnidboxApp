import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/my_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';

import '../../../../../../utils/commons/super_print.dart';

class MyRequestStateNotifier extends StateNotifier<MyRequestState> {
  MyRequestStateNotifier(this._myRequestRepository)
      : super(const MyRequestState.initial());

  final MyRequestRepository _myRequestRepository;
  List<MyRequest> myRequestList = [];

  Future<void> getAllMyRequest(int offset) async {
    try {
      if (myRequestList.isEmpty) {
        state = const MyRequestState.loading();
      }

      Response response = await _myRequestRepository.myrequest(offset);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        myRequestList.add(MyRequest.fromJson(element));
      }
      state = MyRequestState.loadMyRequestData(myRequestList);
      if (dataList.isEmpty) {
        state = const MyRequestState.isDataExist(false);
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  clearMyRequestValue() {
    myRequestList.clear();
  }
}
