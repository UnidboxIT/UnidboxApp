import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/my_request.dart';
part 'my_request_state.freezed.dart';

extension Getters on MyRequestState {
  bool get isLoading => this is MyRequestLoading;
  bool get isAcceptLoading => this is ReceiveLoading;
}

@freezed
class MyRequestState with _$MyRequestState {
  const factory MyRequestState.loadMyRequestData(
      List<MyRequest> myRequestList) = MyRequestList;
  const factory MyRequestState.incrementQty(int index, double qty) =
      IncrementQty;
  const factory MyRequestState.decrementQty(int index, double qty) =
      DecrementQty;
  const factory MyRequestState.isDataExist(bool isExit) = IsDataExit;
  const factory MyRequestState.initial() = Initial;
  const factory MyRequestState.loading() = MyRequestLoading;
  const factory MyRequestState.error({String? error}) = MyRequestError;
  const factory MyRequestState.receivedProductID(int productID) =
      ReceivedProductID;
  const factory MyRequestState.receiveLoading() = ReceiveLoading;
  const factory MyRequestState.searchMyRequestValue(
      List<MyRequest> searchMyRequestList) = SearchMyRequestList;
  const factory MyRequestState.receiveMyRequestState() = ReceiveMyRequestState;
}
