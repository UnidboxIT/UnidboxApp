import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/order_receiving_repository.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state/product_received_remark_state.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../internal_transfer/outlet_request/domain/outlet_reject_reason.dart';

class ProductReceivedRemarkStateNotifier
    extends StateNotifier<ProductReceivedRemarkState> {
  ProductReceivedRemarkStateNotifier(this._orderReceivingRepository)
      : super(const ProductReceivedRemarkState.initial());
  final OrderReceivingRepository _orderReceivingRepository;
  List<ReasonsData> productRemarkList = [];

  Future<void> getProductReceivedRemark() async {
    try {
      state = const ProductReceivedRemarkState.loading();
      productRemarkList.clear();
      Response response =
          await _orderReceivingRepository.productReceivedRemark();
      superPrint(response.body);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        productRemarkList.add(ReasonsData.fromJson(element));
      }
      state = ProductReceivedRemarkState.loadProductReceivedRemark(
          productRemarkList
              .where((e) => e.option == "other" && e.purchase == true)
              .toList());
    } catch (e) {
      superPrint(e.toString());
    }
  }

  addOrderFormReason(String productID, reason, Map<String, dynamic> reasonMap) {
    Map<String, dynamic> mutableReasonMap = Map.from(reasonMap);
    if (mutableReasonMap.containsKey(productID)) {
      // Update the value if it exists
      mutableReasonMap[productID] = reason;
    } else {
      // Create a new entry if it doesn't exist
      mutableReasonMap[productID] = reason;
    }
    superPrint(mutableReasonMap);
    state = ProductReceivedRemarkState.selectedProductReceivedRemark(
        mutableReasonMap);
  }
}
