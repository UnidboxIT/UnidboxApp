import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/product_variety_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/uom_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/create_product_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/product_variety_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/uom_state_notifier.dart';

import 'inventory_tracker_provider.dart';

final createProductStateNotifierProvider =
    StateNotifierProvider<CreateProductStateNotifier, CreateProductState>(
  (ref) => CreateProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final productVariteyStateNotifierProvider =
    StateNotifierProvider<ProductVarietyStateNotifier, ProductVarietyState>(
  (ref) => ProductVarietyStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final uomStateNotifierProvider =
    StateNotifierProvider<UomStateNotifier, UomState>(
  (ref) => UomStateNotifier(ref.watch(inventoryTrackerProvider)),
);
