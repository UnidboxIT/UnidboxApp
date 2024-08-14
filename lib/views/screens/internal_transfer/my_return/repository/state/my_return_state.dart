import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../inventory_tracker/domain/product.dart';
import '../../../my_request/domain/my_request.dart';
part 'my_return_state.freezed.dart';

extension Getters on MyReturnState {
  bool get isLoading => this is MyReturnLoading;
  bool get isUpdateLoading => this is MyReturnUpdateLoading;
}

@freezed
class MyReturnState with _$MyReturnState {
  const factory MyReturnState.loadMyReturnData(
      List<MyRequest> myReturnDataList) = MyReturnDataList;
  const factory MyReturnState.loadScanProduct(List<Products> scanProductList) =
      MyReturnScanProductList;
  const factory MyReturnState.loadSearchProduct(
      List<Products> searchProductList) = SearchMyReturnProductList;
  const factory MyReturnState.initial() = Initial;
  const factory MyReturnState.loading() = MyReturnLoading;
  const factory MyReturnState.updateLoading() = MyReturnUpdateLoading;
  const factory MyReturnState.successUpdateSuccess() = MyReturnUpdateSuccess;
  const factory MyReturnState.myReturnError({String? error}) = MyReturnError;
}
