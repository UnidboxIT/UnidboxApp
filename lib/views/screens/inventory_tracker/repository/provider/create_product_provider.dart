import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/attribute_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/create_product_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/main_uom_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/product_variety_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/multi_uom_state.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/create_product_satet_notifier/attribute_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/create_product_satet_notifier/create_product_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/create_product_satet_notifier/product_variety_state_notifier.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state_notifier/create_product_satet_notifier/multi_uom_state_notifier.dart';

import '../state_notifier/create_product_satet_notifier/main_product_uom_list.dart';
import 'inventory_tracker_provider.dart';

final createProductStateNotifierProvider =
    StateNotifierProvider<CreateProductStateNotifier, CreateProductState>(
  (ref) => CreateProductStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final productVariteyStateNotifierProvider =
    StateNotifierProvider<ProductVarietyStateNotifier, ProductVarietyState>(
  (ref) => ProductVarietyStateNotifier(),
);

final uomStateNotifierProvider =
    StateNotifierProvider<UomStateNotifier, MultiUomState>(
  (ref) => UomStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final mainUomStateNotifierProvider =
    StateNotifierProvider<MainUomStateNotifier, MainUomState>(
  (ref) => MainUomStateNotifier(ref.watch(inventoryTrackerProvider)),
);

final attributeStateNotifierProvider =
    StateNotifierProvider<AttributeStateNotifier, AttributeState>(
  (ref) => AttributeStateNotifier(ref.watch(inventoryTrackerProvider)),
);
