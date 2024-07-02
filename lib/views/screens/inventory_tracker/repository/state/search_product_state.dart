import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/product.dart';
part 'search_product_state.freezed.dart';

extension Getters on SearchProductState {
  bool get isLoading => this is SearchProductLoading;
}

@freezed
class SearchProductState with _$SearchProductState {
  const factory SearchProductState.loadSearchProduct(
      List<Products> searchProductList) = SearchProductList;

  const factory SearchProductState.isSearchDataExist(bool isExit) =
      IsSearchDataExit;
  const factory SearchProductState.initial() = Initial;
  const factory SearchProductState.loading() = SearchProductLoading;
  const factory SearchProductState.error({String? error}) = Error;
}
