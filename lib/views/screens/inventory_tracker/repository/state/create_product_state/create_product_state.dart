import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_state.freezed.dart';

extension Getters on CreateProductState {
  bool get isLoading => this is Loading;
}

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = Initial;
  const factory CreateProductState.loading() = Loading;
  const factory CreateProductState.success() = Success;
  const factory CreateProductState.error({String? error}) = Error;
}
