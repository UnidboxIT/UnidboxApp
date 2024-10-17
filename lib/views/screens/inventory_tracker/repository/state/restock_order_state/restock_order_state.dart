import 'package:freezed_annotation/freezed_annotation.dart';
part 'restock_order_state.freezed.dart';

extension Getters on RestockOrderState {
  bool get isLoading => this is RestockOrderLoading;
}

@freezed
class RestockOrderState with _$RestockOrderState {
  const factory RestockOrderState.incrementRestockOrder(int qty) =
      IncrementRestockOrderQty;
  const factory RestockOrderState.decremenRestockOrder(int qty) =
      DecrementRestockOrderQty;
  const factory RestockOrderState.initial() = Initial;
  const factory RestockOrderState.loading() = RestockOrderLoading;
  const factory RestockOrderState.error({String? error}) = RestockOrderError;
  const factory RestockOrderState.success({String? success}) =
      RestockOrderSuccess;

  const factory RestockOrderState.setResotckTextFieldValue(int qty) =
      SetRestockTextFieldValue;
}
