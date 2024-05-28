import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/inhouse_stock_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_request_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/inhouse_stock_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/stock_request_state_notifier.dart';

import 'inventory_tracker_provider.dart';

final inhouseStockStateNotifierProvider =
    StateNotifierProvider<InhouseStockStateNotifier, InhouseStockState>(
  (ref) => InhouseStockStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final stockRequesstStateNotifierProvider =
    StateNotifierProvider<StockRequestStateNotifier, StockRequestState>(
  (ref) => StockRequestStateNotifier(ref.watch(inventoryTrackerProvider)),
);
