import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/order_receiving_repository.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state/pending_receiving_state.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state_notifier/pending_receiving_state_notifier.dart';

final myReqestProvider = Provider((ref) => OrderReceivingRepository());

final pendingOrderReceivingStateNotifierProvider =
    StateNotifierProvider<PendingReceivingStateNotifier, PendingReceivingState>(
        (ref) {
  return PendingReceivingStateNotifier(ref.watch(myReqestProvider));
});
