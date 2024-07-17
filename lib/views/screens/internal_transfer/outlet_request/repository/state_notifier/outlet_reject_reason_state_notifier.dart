import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/domain/outlet_reject_reason.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/outlet_reject_reason_state.dart';

import '../../../../../../utils/commons/super_print.dart';
import '../other_request_repository.dart';

class OutletRejectReasonStateNotifier
    extends StateNotifier<OutletRejectReasonState> {
  OutletRejectReasonStateNotifier(this._otherRequestRepository)
      : super(const OutletRejectReasonState.initial());
  final OtherRequestRepository _otherRequestRepository;

  List<OutletRejectReason> outletRejectReasonList = [];

  Future<void> getOutletRejectReason() async {
    try {
      state = const OutletRejectReasonState.loading();
      outletRejectReasonList.clear();
      Response response = await _otherRequestRepository.outletRejectReason();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        outletRejectReasonList.add(OutletRejectReason.fromJson(element));
      }
      state = OutletRejectReasonState.loadOutletRejectReason(
          outletRejectReasonList);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
