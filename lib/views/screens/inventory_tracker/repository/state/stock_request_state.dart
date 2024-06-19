import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock_request_state.freezed.dart';

extension Getters on StockRequestState {
  bool get isLoading => this is StockRequestLoading;
}

@freezed
class StockRequestState with _$StockRequestState {
  const factory StockRequestState.success(String success) = Successful;
  const factory StockRequestState.initial() = Initial;
  const factory StockRequestState.loading() = StockRequestLoading;
  const factory StockRequestState.sendRequestSuccess() = StockRequestSuccess;
  const factory StockRequestState.error({String? error}) = Error;
}
