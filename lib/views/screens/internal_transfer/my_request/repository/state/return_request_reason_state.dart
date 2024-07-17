import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/return_request_reason.dart';
part 'return_request_reason_state.freezed.dart';

extension Getters on ReturnRequestReasonState {
  bool get isLoading => this is ReturnReceiveLoading;
}

@freezed
class ReturnRequestReasonState with _$ReturnRequestReasonState {
  const factory ReturnRequestReasonState.loadReturnRequestReason(
          List<ReturnRequestReason> returnRequestReasonList) =
      ReturnRequestReasonList;
  const factory ReturnRequestReasonState.initial() = Initial;
  const factory ReturnRequestReasonState.loading() = ReturnReceiveLoading;
  const factory ReturnRequestReasonState.error({String? error}) =
      ReturnReceiveError;
}
