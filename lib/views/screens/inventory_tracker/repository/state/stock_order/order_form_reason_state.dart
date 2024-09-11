import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../internal_transfer/my_request/domain/return_request_reason.dart';
part 'order_form_reason_state.freezed.dart';

extension Getters on OrderFormReasonState {
  bool get isLoading => this is OrderFormReasonLoading;
}

@freezed
class OrderFormReasonState with _$OrderFormReasonState {
  const factory OrderFormReasonState.loadOrderFormReason(
      List<ReturnRequestReason> orderFormReasonList) = OrderFormReasonList;
  const factory OrderFormReasonState.incrementOrderFormQty(
      Map<String, int> qty) = IncrementOrderFormReason;
  const factory OrderFormReasonState.decrementOrderFormQty(
      Map<String, int> qty) = DecrementOrderFormReason;
  const factory OrderFormReasonState.initial() = Initial;
  const factory OrderFormReasonState.loading() = OrderFormReasonLoading;
  const factory OrderFormReasonState.error({String? error}) =
      OrderFormReasonError;
}
