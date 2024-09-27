import 'package:freezed_annotation/freezed_annotation.dart';
part 'global_return_history_state.freezed.dart';

extension Getters on GlobalReturnHistoryState {
  bool get isLoading => this is GlobalReturnLoading;
}

@freezed
class GlobalReturnHistoryState with _$GlobalReturnHistoryState {
  const factory GlobalReturnHistoryState.error() = GlobalReturnError;
  const factory GlobalReturnHistoryState.initial() = Initial;
  const factory GlobalReturnHistoryState.loading() = GlobalReturnLoading;
  const factory GlobalReturnHistoryState.searchMyRequestHistoryValue(
          List<Map<String, dynamic>> searchMyRequestHistoryList) =
      SearchGlobalReturnHistoyList;
}
