import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../state/product_variety_state.dart';

class ProductVarietyStateNotifier extends StateNotifier<ProductVarietyState> {
  ProductVarietyStateNotifier(this._inventoryTrackerRepository)
      : super(const ProductVarietyState.initial());
  final InventoryTrackerRepository _inventoryTrackerRepository;

  Map<int, dynamic> varietyValueMap = {};
  List varietyIncrementValueList = [];

  Future<void> incrementProductVariety(
    int productVarietyIncrement,
    String varietyBarcode,
    String uom,
    String factor,
    String price,
  ) async {
    addProductVariety(
        productVarietyIncrement, varietyBarcode, uom, factor, price);
    productVarietyIncrement += 1;
    state =
        ProductVarietyState.incrementProductVariety(productVarietyIncrement);
  }

  decrementProductVariety(
    int data,
  ) {
    varietyValueMap.remove(data);
    state = ProductVarietyState.decrementProductVariety(data);
    state = ProductVarietyState.addProductVarietyMap(varietyValueMap);
    superPrint(varietyValueMap);
  }

  Future<void> addProductVariety(
    int productVarietyIncrement,
    String varietyBarcode,
    String uom,
    String factor,
    String price,
  ) async {
    varietyValueMap.addAll({
      productVarietyIncrement: {
        "barcode": varietyBarcode,
        "uom_option": uom,
        "factor": factor,
        "price": price,
      },
    });
    state = ProductVarietyState.addProductVarietyMap(varietyValueMap);
    superPrint(varietyValueMap);
  }

  Future<void> clearProductVarietyMap() async {
    varietyValueMap.clear();
    varietyIncrementValueList.clear();
    superPrint(varietyValueMap);
  }
}
