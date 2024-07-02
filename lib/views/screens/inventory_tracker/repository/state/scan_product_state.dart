import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/product.dart';
part 'scan_product_state.freezed.dart';

extension Getters on ScanProductState {
  bool get isLoading => this is ScanProductLoading;
}

@freezed
class ScanProductState with _$ScanProductState {
  const factory ScanProductState.loadScanProduct(
      List<Products> scanProductList) = ScanProductList;

  const factory ScanProductState.isSearchDataExist(bool isExit) =
      IsScanDataExit;
  const factory ScanProductState.initial() = Initial;
  const factory ScanProductState.loading() = ScanProductLoading;
  const factory ScanProductState.error({String? error}) = Error;
}
