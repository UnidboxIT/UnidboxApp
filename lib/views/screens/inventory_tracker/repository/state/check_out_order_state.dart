import 'package:freezed_annotation/freezed_annotation.dart';
part 'check_out_order_state.freezed.dart';

extension Getters on CheckOutOrderState {
  bool get isLoading => this is CheckOutLoading;
}

@freezed
class CheckOutOrderState with _$CheckOutOrderState {
  const factory CheckOutOrderState.success(String success) = Successful;
  const factory CheckOutOrderState.calculateTotalPrice(double totalPrice) =
      CalculateTotalPrice;
  const factory CheckOutOrderState.initial() = Initial;
  const factory CheckOutOrderState.loading() = CheckOutLoading;
  const factory CheckOutOrderState.error({String? error}) = CheckOutError;
}
