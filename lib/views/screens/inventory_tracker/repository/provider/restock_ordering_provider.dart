import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/restock_order_state/restock_order_state.dart';
import '../state_notifier/restock_order_state_notifier/restock_order_state_notifier.dart';
import 'inventory_tracker_provider.dart';

final restockOrderStateNotifierProvider =
    StateNotifierProvider<RestockOrderStateNotifier, RestockOrderState>(
  (ref) => RestockOrderStateNotifier(ref.watch(inventoryTrackerProvider)),
);
