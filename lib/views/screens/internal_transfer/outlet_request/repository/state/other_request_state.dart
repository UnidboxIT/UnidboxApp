import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/other_request.dart';
part 'other_request_state.freezed.dart';

extension Getters on OtherRequestState {
  bool get isLoading => this is OtherRequestLoading;
  bool get isAcceptLoading => this is AcceptLoading;
}

@freezed
class OtherRequestState with _$OtherRequestState {
  const factory OtherRequestState.loadOtherRequestData(
      List<OtherRequest> otherRequestList) = OtherRequestList;
  const factory OtherRequestState.incrementQty(int index, double qty) =
      IncrementQty;
  const factory OtherRequestState.decrementQty(int index, double qty) =
      DecrementQty;
  const factory OtherRequestState.isDataExist(bool isExit) = IsDataExit;
  const factory OtherRequestState.initial() = Initial;
  const factory OtherRequestState.loading() = OtherRequestLoading;
  const factory OtherRequestState.acceptLoading() = AcceptLoading;
  const factory OtherRequestState.searchOtherRequestValue(
      List<Map<int, dynamic>> searchOtherRequestList) = SearchOtherRequestList;
  const factory OtherRequestState.acceptProductID(int productID) =
      AcceptProductID;
  const factory OtherRequestState.error({String? error}) = Error;
}
