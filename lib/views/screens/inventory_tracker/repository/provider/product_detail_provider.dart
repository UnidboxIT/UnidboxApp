import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/product_detail_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/product_detail_state_notifier.dart';

import 'inventory_tracker_provider.dart';

final productDetailStateNotifierProvider =
    StateNotifierProvider<ProductDetailStateNotifier, ProductDetailState>(
  (ref) => ProductDetailStateNotifier(ref.watch(inventoryTrackerProvider)),
);
