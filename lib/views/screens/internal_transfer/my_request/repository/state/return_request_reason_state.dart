import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../outlet_request/domain/outlet_reject_reason.dart';
part 'return_request_reason_state.freezed.dart';

extension Getters on ReturnRequestReasonState {
  bool get isLoading => this is ReturnReceiveLoading;
}

@freezed
class ReturnRequestReasonState with _$ReturnRequestReasonState {
  const factory ReturnRequestReasonState.loadReturnRequestReason(
      List<ReasonsData> returnRequestReasonList) = ReturnRequestReasonList;
  const factory ReturnRequestReasonState.initial() = Initial;
  const factory ReturnRequestReasonState.loading() = ReturnReceiveLoading;
  const factory ReturnRequestReasonState.error({String? error}) =
      ReturnReceiveError;
}
