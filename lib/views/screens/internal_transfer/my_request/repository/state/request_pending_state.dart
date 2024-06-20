import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_pending_state.freezed.dart';

extension Getters on RequestPendingState {}

@freezed
class RequestPendingState with _$RequestPendingState {
  const factory RequestPendingState.initial() = Initial;
  const factory RequestPendingState.isRequestUpdate(
      bool isRequestUpdate, int productID) = IsRequestUpdate;
}
