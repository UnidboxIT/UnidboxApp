import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/stock_order/good_return_state.dart';

class GoodReturnStockOrderStateNotifier extends StateNotifier<GoodReturnState> {
  GoodReturnStockOrderStateNotifier() : super(const GoodReturnState.initial());

  addGoodReturnValue(Map<int, List<Map<int, bool>>> isGoodReturnMap) {
    state = GoodReturnState.selectedGoodReturn(isGoodReturnMap);
  }

  clearGoodReturn() {
    state = const GoodReturnState.clearSelectedGoodReturn();
  }
}
