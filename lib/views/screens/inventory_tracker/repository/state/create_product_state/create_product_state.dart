import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
part 'create_product_state.freezed.dart';

extension Getters on CreateProductState {
  bool get isLoading => this is LoadingProduct;
}

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = Initial;
  const factory CreateProductState.loading() = LoadingProduct;
  const factory CreateProductState.saveImage(String image) = SaveImageBase64;
  const factory CreateProductState.clearImage() = ClearImage;
  const factory CreateProductState.selectedMainUom(Uom uom) = SelectedMainUom;
  const factory CreateProductState.success() = SuccessCreateProduct;
  const factory CreateProductState.error({String? error}) = CreateProductError;
}
