import 'package:freezed_annotation/freezed_annotation.dart';
part 'accepted_product_state.freezed.dart';

extension Getters on AcceptedProductState {
  bool get isLoading => this is AcceptedLoading;
}

@freezed
class AcceptedProductState with _$AcceptedProductState {
  const factory AcceptedProductState.loadOtherRequestData(
          Map<int, Map<String, dynamic>> acceptedProductLineMap) =
      AcceptedProductLineMap;
  const factory AcceptedProductState.initial() = Initial;
  const factory AcceptedProductState.loading() = AcceptedLoading;
  const factory AcceptedProductState.error({String? error}) = Error;
}
