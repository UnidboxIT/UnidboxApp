import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/auth/repository/auth_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/check_out_order_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_order/stock_ordering_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/check_out_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/stock_order/stock_ordering_state_notifier.dart';
import 'inventory_tracker_provider.dart';

final stockOrderStateNotifierProvider =
    StateNotifierProvider<StockOrderingStateNotifier, StockOrderingState>(
  (ref) => StockOrderingStateNotifier(
    ref.watch(inventoryTrackerProvider),
    ref.watch(sharedPreferencesProvider),
  ),
);

final checkoutOrderStateNotifierProvider =
    StateNotifierProvider<CheckOutStateNotifier, CheckOutOrderState>(
  (ref) => CheckOutStateNotifier(ref.watch(inventoryTrackerProvider)),
);
