import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_request_state.freezed.dart';

extension Getters on ReturnRequestState {
  bool get isLoading => this is ReturnRequestLoading;
}

@freezed
class ReturnRequestState with _$ReturnRequestState {
  const factory ReturnRequestState.incrementQty(int index, int qty) =
      IncrementReturnQty;
  const factory ReturnRequestState.decrementQty(int index, int qty) =
      DecrementReturnQty;
  const factory ReturnRequestState.addQtyTextFieldValue(int index, int qty) =
      AddQtyTextFieldValue;
  const factory ReturnRequestState.initial() = Initial;
  const factory ReturnRequestState.loading() = ReturnRequestLoading;
  const factory ReturnRequestState.error({String? error}) = ReturnRequestError;
}