import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/stock_order.dart';
part 'stock_ordering_state.freezed.dart';

extension Getters on StockOrderingState {
  bool get isLoading => this is StockOrderingLoading;
}

@freezed
class StockOrderingState with _$StockOrderingState {
  const factory StockOrderingState.loadStockOrdering(
      List<StockOrder> stockOrdering) = StockOrderingList;
  const factory StockOrderingState.incrementStockOrderQty(Map<int, int> qty) =
      IncrementStockOrderQty;
  const factory StockOrderingState.decremenStockOrderQty(Map<int, int> qty) =
      DecrementStockOrderQty;
  const factory StockOrderingState.initial() = Initial;
  const factory StockOrderingState.loading() = StockOrderingLoading;
  const factory StockOrderingState.error({String? error}) = Error;
}
