import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/inventory_tracker_provider.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_state.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/scan_product_state.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/search_product_state.dart';
import 'package:unidbox_app/inventory_tracker/repository/state_notifier/product_state_notifier.dart';

import '../state_notifier/scan_product_state_notifier.dart';
import '../state_notifier/search_product_state_notifier.dart';

final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, ProductState>(
  (ref) => ProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final searchProductStateNotifierProvier =
    StateNotifierProvider<SearchProductStateNotifier, SearchProductState>(
  (ref) => SearchProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final scanProductStateNotifierProvier =
    StateNotifierProvider<ScanProductStateNotifier, ScanProductState>(
  (ref) => ScanProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);
