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

  Future<void> getAllMyRequest() async {
    try {
      state = const MyRequestState.loading();
      Response response = await _myRequestRepository.myrequest();
      var result = jsonDecode(response.body);
      myRequestList.clear();
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        myRequestList.add(MyRequest.fromJson(element));
      }

      state = MyRequestState.loadMyRequestData(myRequestList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> doneMyRequest(int productID) async {
    try {
      state = const MyRequestState.loading();
      Response response = await _myRequestRepository.done(productID);
      superPrint(response);
      var result = jsonDecode(response.body);
      superPrint(result);
      getAllMyRequest();
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
