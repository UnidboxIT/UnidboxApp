import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../outlet_request/domain/other_request.dart';
import '../outlet_return_repository.dart';
import '../state/outlet_return_state.dart';

class OutletReturnStateNotifier extends StateNotifier<OutletReturnState> {
  OutletReturnStateNotifier(this._outletReturnRepository)
      : super(const OutletReturnState.initial());

  final OutletReturnRepository _outletReturnRepository;
  List<OtherRequest> outletReturnList = [];

  Future<void> getAlloutletReturn() async {
    try {
      state = const OutletReturnState.loading();
      outletReturnList.clear();
      Response response = await _outletReturnRepository.outletReturn();
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        outletReturnList.add(OtherRequest.fromJson(element));
      }

      state = OutletReturnState.loadOtherRequestData(outletReturnList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> outletReturnReceived(int productID, BuildContext context) async {
    try {
      state = const OutletReturnState.acceptLoading();
      state = OutletReturnState.returnReceivedProductID(productID);
      Response response =
          await _outletReturnRepository.returnReceived(productID);
      // superPrint(response.body);
      var result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          getAlloutletReturn();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
          state = const OutletReturnState.outletReturnError();
        }
      }
    } catch (e) {
      superPrint(e.toString());
      state = const OutletReturnState.outletReturnError();
    }
  }
}
