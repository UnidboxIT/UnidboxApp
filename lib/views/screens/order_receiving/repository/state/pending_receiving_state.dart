import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/order_receiving/domain/order_receiving.dart';
part 'pending_receiving_state.freezed.dart';

extension Getters on PendingReceivingState {
  bool get isLoading => this is PendingReceivingLoading;
}

@freezed
class PendingReceivingState with _$PendingReceivingState {
  const factory PendingReceivingState.loadPendingReceivingData(
      List<OrderReceiving> pendingReceivingDataList) = PendingReceivingData;
  const factory PendingReceivingState.initial() = Initial;
  const factory PendingReceivingState.loading() = PendingReceivingLoading;
  const factory PendingReceivingState.error({String? error}) =
      PendingReceivingError;
  const factory PendingReceivingState.success({String? success}) =
      PendingReceivingSuccess;
}
