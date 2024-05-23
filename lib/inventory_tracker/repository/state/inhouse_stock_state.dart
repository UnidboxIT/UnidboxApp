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
  const factory InhouseStockState.initial() = Initial;
  const factory InhouseStockState.loading() = InHouseLoading;
  const factory InhouseStockState.error({String? error}) = Error;
}
