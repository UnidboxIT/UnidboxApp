import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../outlet_request/domain/outlet_reject_reason.dart';
part 'my_return_reason_state.freezed.dart';

extension Getters on MyReturnReasonState {
  bool get isLoading => this is MyReturnReasonLoading;
}

@freezed
class MyReturnReasonState with _$MyReturnReasonState {
  const factory MyReturnReasonState.loadReturnRequestReason(
      List<ReasonsData> myReturnReasonList) = MyReturnReasonList;
  const factory MyReturnReasonState.incrementQty(int index, int qty) =
      IncrementReturnQty;
  const factory MyReturnReasonState.decrementQty(int index, int qty) =
      DecrementReturnQty;
  const factory MyReturnReasonState.addQtyTextFieldValue(int index, int qty) =
      AddQtyTextFieldValue;
  const factory MyReturnReasonState.initial() = Initial;
  const factory MyReturnReasonState.loading() = MyReturnReasonLoading;
  const factory MyReturnReasonState.error({String? error}) =
      MyReturnReasonError;
}
