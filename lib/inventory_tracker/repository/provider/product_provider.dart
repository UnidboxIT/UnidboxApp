import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/inventory_tracker/repository/provider/inventory_tracker_provider.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_state.dart';
import 'package:unidbox_app/inventory_tracker/repository/state_notifier/product_state_notifier.dart';

final productStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, ProductState>(
  (ref) => ProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);
