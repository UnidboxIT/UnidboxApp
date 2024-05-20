import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../inventory_tracker_repository.dart';
import '../state/inventory_tacker_state.dart';
import '../state_notifier/inventory_tracker_state_notifier.dart';

final inventoryTrackerProvider = StateProvider((ref) {
  return InventoryTrackerRepository();
});

final inventroyTrackerStateNotifier =
    StateNotifierProvider<InventoryTrackerStateNotifier, InventoryTrackerState>(
  (ref) {
    return InventoryTrackerStateNotifier(ref.watch(inventoryTrackerProvider));
  },
);
