import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/other_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/other_request_state.dart';

import '../../../../../../utils/commons/super_print.dart';

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
}
