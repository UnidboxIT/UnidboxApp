import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/widgets/bottom_sheets/successfully_bottom_sheet.dart';

import '../../../../../../utils/commons/super_print.dart';
import '../../state/create_product_state/create_product_state.dart';

class CreateProductStateNotifier extends StateNotifier<CreateProductState> {
  CreateProductStateNotifier(this._inventoryTrackerRepository)
      : super(const CreateProductState.initial());
  final InventoryTrackerRepository _inventoryTrackerRepository;

  Future<void> createEachProduct(
      String base64Image,
      String name,
      String model,
      String vendor,
      String brand,
      String uomName,
      String barcode,
      String salePrice,
      String costPrice,
      List attributeList,
      List productVarietyList,
      BuildContext context) async {
    state = const CreateProductState.loading();
    try {
      superPrint(name);
      superPrint(model);
      superPrint(vendor);
      superPrint(brand);
      superPrint(uomName);
      superPrint(barcode);
      superPrint(salePrice);
      superPrint(costPrice);
      superPrint(attributeList);
      superPrint(productVarietyList);
      Response response = await _inventoryTrackerRepository.createProduct(
          base64Image,
          name,
          model,
          vendor,
          brand,
          uomName,
          barcode,
          salePrice,
          costPrice,
          attributeList,
          productVarietyList);

      var result = jsonDecode(response.body);
      superPrint(result['error']['message']);

      successfullyBottomSheet("Temporary Product", result['result']['message'],
          () {
        Navigator.of(context).pop();
      }, context);
      state = const CreateProductState.success();
    } catch (e) {
      superPrint(e.toString());
    }
  }

  saveImage(String image) {
    state = CreateProductState.saveImage(image);
  }

  // uomSelected(Uom uom) {
  //   state = CreateProductState.selectedMainUom(uom);
  // }
}
