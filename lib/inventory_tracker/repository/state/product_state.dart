import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';
part 'product_state.freezed.dart';

extension Getters on ProductState {
  bool get isLoading => this is Loading;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.loadProduct(List<Products> productList) =
      ProductsList;
  const factory ProductState.loadProductDetail(Products products) =
      ProductDetail;
  const factory ProductState.isDataExist(bool isExit) = IsDataExit;
  const factory ProductState.loadInHouseStock(List<InhouseStock> inhouseStock) =
      InhouseStockList;
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = Loading;
  const factory ProductState.error({String? error}) = Error;
}
