import 'package:state_notifier/state_notifier.dart';
import '../state/request_pending_state.dart';

class RequestPendingStateNotifier extends StateNotifier<RequestPendingState> {
  RequestPendingStateNotifier() : super(const RequestPendingState.initial());

  myRequestPending(bool isRequestUpdate, {int productID = -1}) {
    state = RequestPendingState.isRequestUpdate(isRequestUpdate, productID);
  }
}
