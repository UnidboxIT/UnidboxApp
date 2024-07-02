import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/inhouse_stock.dart';
part 'inhouse_stock_state.freezed.dart';

extension Getters on InhouseStockState {
  bool get isLoading => this is InHouseLoading;
}

@freezed
class InhouseStockState with _$InhouseStockState {
  const factory InhouseStockState.loadInHouseStock(
      List<InhouseStock> inhouseStock) = InhouseStockList;
  const factory InhouseStockState.selectedBox(int uomIndex) = SelectedBoxType;
  const factory InhouseStockState.incrementQty(int qty) = IncrementQty;
  const factory InhouseStockState.decrementQty(int qty) = DecrementQty;
  const factory InhouseStockState.urgent(bool selectedUrgent) = Urgent;
  const factory InhouseStockState.isOverQuantity(bool isOver) = OverQty;
  const factory InhouseStockState.initial() = Initial;
  const factory InhouseStockState.loading() = InHouseLoading;
  const factory InhouseStockState.error({String? error}) = Error;

  const factory InhouseStockState.defaultWarehouseQtyIncrement(
      String productID, int qty) = DefaultWarehouseIncrementQty;
  const factory InhouseStockState.defaultWarehouseQtyDecrement(
      String productID, int qty) = DefaultWarehouseDecrementQty;
  const factory InhouseStockState.defaultWarehouseTextFieldValue(
      String productID, int qty) = DefaultWarehouseTextFieldValue;

  const factory InhouseStockState.selectedWarehouseUrgent(
      String productID, bool selectedUrgent) = SelectedWarehouseUrgent;
  const factory InhouseStockState.unselectedWarehouseUrgent(
      String productID, bool selectedUrgent) = UnselectedWarehouseUrgent;

  const factory InhouseStockState.selectedWarehouse(int warehouseID, int qty) =
      SelectedWarehouseID;
}
