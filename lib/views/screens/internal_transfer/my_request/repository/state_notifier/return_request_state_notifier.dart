import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/return_request_state.dart';

class ReturnRequestStateNotifier extends StateNotifier<ReturnRequestState> {
  ReturnRequestStateNotifier() : super(const ReturnRequestState.initial());

  addQtyTextFieldValue(String productID, int qty) {
    state =
        ReturnRequestState.addReturnRequestQtyTextFieldValue(productID, qty);
  }

  incrementTotalQty(String productID, int qty, int receiveQty, int totalQty) {
    if (receiveQty > totalQty) {
      qty = qty + 1;
      state = ReturnRequestState.incrementQty(productID, qty);
    }
  }

  decrementTotalQty(String productID, int qty) {
    if (qty >= 1) {
      qty--;
      state = ReturnRequestState.decrementQty(productID, qty);
    }
  }
}
