import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/stock_order/add_order_cart_state.dart';

import '../../../../../../utils/commons/super_print.dart';

class AddOrderCartStateNotifier extends StateNotifier<AddOrderCartState> {
  AddOrderCartStateNotifier() : super(const AddOrderCartState.initial());
  incrementAddOrderCart(
    int vendorId,
    String vendorName,
    Map<int, int> qtyMap,
    Map<int, List<Map<String, dynamic>>> orderFormValueMap,
    Products productDetail,
    bool isOnTap,
  ) async {
    Map<int, int> mutableQtyMap = Map.from(qtyMap);
    Map<int, List<Map<String, dynamic>>> mutableOrderFormValueMap = {};
    if (mutableQtyMap.containsKey(vendorId)) {
      mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! + 1;
    } else {
      mutableQtyMap[vendorId] = 1;
    }

    Map<String, dynamic> newProductEntry = {
      'product_id': productDetail.id,
      'name': productDetail.name,
      'product_qty': mutableQtyMap[vendorId],
      'product_uom': productDetail.uomList[0],
      'price_unit': productDetail.price,
    };

    if (mutableOrderFormValueMap.containsKey(vendorId)) {
      List<Map<String, dynamic>> existingProducts =
          mutableOrderFormValueMap[vendorId]!;
      bool productExists = false;
      for (var product in existingProducts) {
        if (product['product_id'] == productDetail.id) {
          product['product_qty'] = mutableQtyMap[vendorId];
          productExists = true;
          break;
        }

        if (!productExists) {
          existingProducts.add(newProductEntry);
        }
      }
    } else {
      mutableOrderFormValueMap[vendorId] = [newProductEntry];
    }

    superPrint(mutableOrderFormValueMap);
    superPrint(newProductEntry);

    state = AddOrderCartState.checkOutMap(mutableOrderFormValueMap);
    state = AddOrderCartState.incrementOrderCart(mutableQtyMap);
  }

  Future<void> clearAddOrderMap() async {
    state = const AddOrderCartState.incrementOrderCart({});
    state = const AddOrderCartState.checkOutMap({});
  }

  decrementAddOrderCart(
    int vendorId,
    String vendorName,
    Map<int, int> qtyMap,
    Map<int, List<Map<String, dynamic>>> orderFormValueMap,
    Products productDetail,
  ) async {
    Map<int, int> mutableQtyMap = Map.from(qtyMap);

    if (qtyMap.containsKey(vendorId)) {
      mutableQtyMap[vendorId] = mutableQtyMap[vendorId]! - 1;
    } else {
      mutableQtyMap[vendorId] = -1;
    }
    superPrint(mutableQtyMap[vendorId]);

    Map<String, dynamic> newProductEntry = {
      'product_id': productDetail.id,
      'name': productDetail.name,
      'product_qty': mutableQtyMap[vendorId],
      'product_uom': productDetail.uomList[0],
      'price_unit': productDetail.price,
    };

    if (orderFormValueMap.containsKey(vendorId)) {
      List<Map<String, dynamic>> existingProducts =
          orderFormValueMap[vendorId]!;
      bool productExists = false;
      for (var product in existingProducts) {
        if (product['product_id'] == productDetail.id) {
          product['product_qty'] = mutableQtyMap[vendorId];
          productExists = true;
          break;
        }
      }
     
      if (!productExists) {
        existingProducts.add(newProductEntry);
      }
    } else {
      orderFormValueMap[vendorId] = [newProductEntry];
    }
    state = AddOrderCartState.checkOutMap(orderFormValueMap);
    state = AddOrderCartState.decremenOrderCart(mutableQtyMap);
  }
}
