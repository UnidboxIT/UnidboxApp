import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../order_receiving/domain/order_receiving.dart';
import '../../../domain/stock_order.dart';
part 'stock_ordering_state.freezed.dart';

extension Getters on StockOrderingState {
  bool get isLoading => this is StockOrderingLoading;
}

@freezed
class StockOrderingState with _$StockOrderingState {
  const factory StockOrderingState.loadStockOrdering(
      List<StockOrder> stockOrdering) = StockOrderingList;
  const factory StockOrderingState.loadPendingReceivingData(
      List<OrderReceiving> orderFormDataList) = OrderFormDataList;
  const factory StockOrderingState.backupCheckOut(
      Map<String, List<Map<String, dynamic>>> checkoutMap) = BackupCheckOut;
  const factory StockOrderingState.clearTotalQty(Map<int, int> totalQty) =
      ClearTotalQty;
  const factory StockOrderingState.initial() = Initial;
  const factory StockOrderingState.loading() = StockOrderingLoading;
  const factory StockOrderingState.error({String? error}) = Error;
  const factory StockOrderingState.success(String success) =
      StockOrderingSuccess;
}
