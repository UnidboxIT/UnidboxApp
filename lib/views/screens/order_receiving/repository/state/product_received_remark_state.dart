import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../internal_transfer/my_request/domain/return_request_reason.dart';
part 'product_received_remark_state.freezed.dart';

extension Getters on ProductReceivedRemarkState {
  bool get isLoading => this is ProducReceivedRemarkLoading;
}

@freezed
class ProductReceivedRemarkState with _$ProductReceivedRemarkState {
  const factory ProductReceivedRemarkState.loadProductReceivedRemark(
          List<ReturnRequestReason> productReceivedRemarkList) =
      ProductReceivedRemarkList;
  const factory ProductReceivedRemarkState.selectedProductReceivedRemark(
          Map<String, dynamic> selectedProductReceivedRemark) =
      SelectedProductReceivedRemark;
  const factory ProductReceivedRemarkState.initial() = Initial;
  const factory ProductReceivedRemarkState.loading() =
      ProducReceivedRemarkLoading;
  const factory ProductReceivedRemarkState.error({String? error}) =
      ProducReceivedRemarkError;
}
