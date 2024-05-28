import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/product.dart';
part 'product_detail_state.freezed.dart';

extension Getters on ProductDetailState {
  bool get isLoading => this is ProductDetailLoading;
}

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.loadProductDetail(Products products) =
      ProductDetail;
  const factory ProductDetailState.isDataExist(bool isExit) = IsDataExit;
  const factory ProductDetailState.initial() = Initial;
  const factory ProductDetailState.loading() = ProductDetailLoading;
  const factory ProductDetailState.error({String? error}) = Error;
}
