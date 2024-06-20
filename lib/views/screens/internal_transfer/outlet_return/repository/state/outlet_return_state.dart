import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../outlet_request/domain/other_request.dart';
part 'outlet_return_state.freezed.dart';

extension Getters on OutletReturnState {
  bool get isLoading => this is OutletReturnLoading;
  bool get isAcceptLoading => this is ReceiveLoading;
}

@freezed
class OutletReturnState with _$OutletReturnState {
  const factory OutletReturnState.loadOtherRequestData(
      List<OtherRequest> outletReturnList) = OutletReturnList;
  const factory OutletReturnState.initial() = Initial;
  const factory OutletReturnState.loading() = OutletReturnLoading;
  const factory OutletReturnState.acceptLoading() = ReceiveLoading;
  const factory OutletReturnState.error({String? error}) = Error;
  const factory OutletReturnState.returnReceivedProductID(int productID) =
      ReturnReceivedProductID;
}
