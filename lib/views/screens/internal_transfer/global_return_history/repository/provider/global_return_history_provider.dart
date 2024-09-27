import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/global_return_history_state.dart';
import '../state_notifier/global_return_history_state_notifier.dart';

final globalReturnHistoryStateNotifierProvider =
    StateNotifierProvider<GlobalReturnStateNotifier, GlobalReturnHistoryState>(
        (ref) {
  return GlobalReturnStateNotifier();
});
