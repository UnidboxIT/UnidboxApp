import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_order_cart_state.freezed.dart';

extension Getters on AddOrderCartState {
  bool get isLoading => this is AddOrderCartLoading;
}

@freezed
class AddOrderCartState with _$AddOrderCartState {
  const factory AddOrderCartState.addOrderCarList(
      List<Map<String, dynamic>> addOrderCartList) = AddOrderCartList;
  const factory AddOrderCartState.checkOutMap(
      Map<int, List<Map<String, dynamic>>> checkoutMap) = CheckOutMap;
  const factory AddOrderCartState.incrementOrderCart(Map<int, int> qty) =
      IncrementOrderCartQty;
  const factory AddOrderCartState.decremenOrderCart(Map<int, int> qty) =
      DecrementOrderCartQty;
  const factory AddOrderCartState.initial() = Initial;
  const factory AddOrderCartState.loading() = AddOrderCartLoading;
  const factory AddOrderCartState.error({String? error}) = AddOrderCartError;
}
