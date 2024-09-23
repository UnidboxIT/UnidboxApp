import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_request_history_state.freezed.dart';

extension Getters on MyRequestHistoryState {
  bool get isLoading => this is MyRequestHistoryLoading;
}

@freezed
class MyRequestHistoryState with _$MyRequestHistoryState {
  const factory MyRequestHistoryState.error() = MyRequestHistoryError;
  const factory MyRequestHistoryState.initial() = Initial;
  const factory MyRequestHistoryState.loading() = MyRequestHistoryLoading;
  const factory MyRequestHistoryState.searchMyRequestHistoryValue(
          List<Map<String, dynamic>> searchMyRequestHistoryList) =
      SearchMyRequestHistoyList;
}
