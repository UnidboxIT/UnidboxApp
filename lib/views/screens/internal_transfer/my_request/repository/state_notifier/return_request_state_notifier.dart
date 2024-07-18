import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../my_request_repository.dart';
import '../state/return_request_state.dart';

class ReturnRequestStateNotifier extends StateNotifier<ReturnRequestState> {
  ReturnRequestStateNotifier(this._myRequestRepository)
      : super(const ReturnRequestState.initial());
  final MyRequestRepository _myRequestRepository;

  addQtyTextFieldValue(int productID, int qty) {
    state = ReturnRequestState.addQtyTextFieldValue(productID, qty);
  }

  incrementTotalQty(int productID, int qty) {
    qty = qty + 1;
    state = ReturnRequestState.incrementQty(productID, qty);
  }

  decrementTotalQty(int productID, int qty) {
    if (qty >= 1) {
      qty--;
      state = ReturnRequestState.decrementQty(productID, qty);
    }
  }
}
