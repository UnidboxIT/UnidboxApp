import 'package:state_notifier/state_notifier.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/accepted_product_state.dart';

class AcceptedProductStateNotifier extends StateNotifier<AcceptedProductState> {
  AcceptedProductStateNotifier() : super(const AcceptedProductState.initial());

  Map<int, Map<String, dynamic>> otherRequestMap = {};

  addAcceptedProdutcLine(
      int warehouseId,
      String warehouseName,
      String requestCode,
      String name,
      String currentDate,
      ProductLineId productLineId) {
    superPrint(productLineId);
    if (otherRequestMap.containsKey(warehouseId)) {
      // If the warehouseId exists, append the product line to the existing list
      otherRequestMap[warehouseId]!.addAll({
        "warehouse_name": warehouseName,
        "code": requestCode,
        "name": name,
        "date": currentDate,
        "product_line": productLineId
      });
    } else {
      // If the warehouseId does not exist, create a new entry
      otherRequestMap[warehouseId] = {
        "warehouse_name": warehouseName,
        "code": requestCode,
        "name": name,
        "date": currentDate,
        "product_line": productLineId
      };
    }
    state = AcceptedProductState.loadOtherRequestData(otherRequestMap);
    superPrint(otherRequestMap);
  }

  clearOtherRequestMap() {
    otherRequestMap.clear();
  }
}
