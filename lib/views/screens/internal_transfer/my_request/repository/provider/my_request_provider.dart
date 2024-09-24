import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_history_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/return_request_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state_notifier/my_request_history_state_notifier.dart';
import '../my_request_repository.dart';
import '../state/my_request_state.dart';
import '../state/request_pending_state.dart';
import '../state/return_request_reason_state.dart';
import '../state_notifier/my_request_state_notifier.dart';
import '../state_notifier/request_pending_state_notifier.dart';
import '../state_notifier/return_request_reason_state_notifier.dart';
import '../state_notifier/return_request_state_notifier.dart';

final myReqestProvider = Provider((ref) => MyRequestRepository());

final myRequestStateNotifierProvider =
    StateNotifierProvider<MyRequestStateNotifier, MyRequestState>((ref) {
  return MyRequestStateNotifier(ref.watch(myReqestProvider));
});

final myRequestHistoryStateNotifierProvider =
    StateNotifierProvider<MyRequestHistoryStateNotifier, MyRequestHistoryState>(
        (ref) {
  return MyRequestHistoryStateNotifier();
});

final requestPendingStateNotifierProvider =
    StateNotifierProvider<RequestPendingStateNotifier, RequestPendingState>(
        (ref) => RequestPendingStateNotifier());

final returnRequestReasonStateNotifierProvider = StateNotifierProvider<
        ReturnRequestReasonStateNotifier, ReturnRequestReasonState>(
    (ref) => ReturnRequestReasonStateNotifier(ref.watch(myReqestProvider)));

final returnRequestStateNotifierProvider =
    StateNotifierProvider<ReturnRequestStateNotifier, ReturnRequestState>(
        (ref) => ReturnRequestStateNotifier());
