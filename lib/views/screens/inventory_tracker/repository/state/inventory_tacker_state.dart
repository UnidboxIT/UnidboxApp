import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/inventory_tracker.dart';
part 'inventory_tacker_state.freezed.dart';

extension Getters on InventoryTrackerState {
  bool get isLoading => this is Loading;
}

@freezed
class InventoryTrackerState with _$InventoryTrackerState {
  const factory InventoryTrackerState.loadInventoryTrcker(
      List<InventoryTracker> inventoryTracker) = InventoryTrackerList;
  const factory InventoryTrackerState.loadCategory(
      Map<int, List<InventoryTracker>> categoryMap) = CategoryListMap;
  const factory InventoryTrackerState.initial() = Initial;
  const factory InventoryTrackerState.loading() = Loading;
  const factory InventoryTrackerState.error({String? error}) = Error;
}
