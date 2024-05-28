import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/product.dart';
part 'search_product_state.freezed.dart';

extension Getters on SearchProductState {
  bool get isLoading => this is Loading;
}

@freezed
class SearchProductState with _$SearchProductState {
  const factory SearchProductState.loadSearchProduct(
      List<Products> searchProductList) = SearchProductList;

  const factory SearchProductState.isSearchDataExist(bool isExit) =
      IsSearchDataExit;
  const factory SearchProductState.initial() = Initial;
  const factory SearchProductState.loading() = Loading;
  const factory SearchProductState.error({String? error}) = Error;
}
