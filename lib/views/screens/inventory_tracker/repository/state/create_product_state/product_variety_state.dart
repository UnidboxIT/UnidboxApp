import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_variety_state.freezed.dart';

extension Getters on ProductVarietyState {
  bool get isLoading => this is Loading;
}

@freezed
class ProductVarietyState with _$ProductVarietyState {
  const factory ProductVarietyState.initial() = Initial;
  const factory ProductVarietyState.success() = Success;
  const factory ProductVarietyState.loading() = Loading;
  const factory ProductVarietyState.incrementProductVariety(int qty) =
      IncrementProductVariety;
  const factory ProductVarietyState.decrementProductVariety(int removeId) =
      DecrementProductVariety;
  const factory ProductVarietyState.addProductVarietyMap(
      Map<int, dynamic> varietyValueMap) = ProductVarietyValueMap;
  const factory ProductVarietyState.error({String? error}) = Error;
}
