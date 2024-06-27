import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../outlet_request/domain/warehouse.dart';
part 'warehouse_state.freezed.dart';

extension Getters on WarehouseState {
  bool get isLoading => this is WarehouseLoading;
}

@freezed
class WarehouseState with _$WarehouseState {
  const factory WarehouseState.loadWarehouseData(
      List<Warehouse> warehouseList) = WarehouseList;
  const factory WarehouseState.initial() = Initial;
  const factory WarehouseState.loading() = WarehouseLoading;
  const factory WarehouseState.warehouseError({String? error}) = WarehouseError;
}
