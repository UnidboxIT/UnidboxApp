import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/rack_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/rack_state_notifier.dart';

import 'inventory_tracker_provider.dart';

final rackStateNotifierProvider =
    StateNotifierProvider<RackStateNotifier, RackState>(
  (ref) => RackStateNotifier(ref.watch(inventoryTrackerProvider)),
);
