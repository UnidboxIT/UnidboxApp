import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
part 'insufficient_stock_state.freezed.dart';

extension Getters on InsufficientStockState {
  bool get isLoading => this is InsuffcientLoading;
}

@freezed
class InsufficientStockState with _$InsufficientStockState {
  const factory InsufficientStockState.success(String success) = Successful;
  const factory InsufficientStockState.laodProductList(
      List<Products> productList) = ProductList;
  const factory InsufficientStockState.isDataExist(bool isExit) = IsDataExit;
  const factory InsufficientStockState.initial() = Initial;
  const factory InsufficientStockState.loading() = InsuffcientLoading;
  const factory InsufficientStockState.error({String? error}) = Error;
}
