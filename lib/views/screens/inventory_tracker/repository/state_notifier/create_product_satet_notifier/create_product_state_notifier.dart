import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
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
      String barcode,
      String salePrice,
      String costPrice,
      List productVarietyList,
      BuildContext context) async {
    try {
      Response response = await _inventoryTrackerRepository.createProduct(
          base64Image,
          name,
          model,
          vendor,
          brand,
          barcode,
          salePrice,
          costPrice,
          productVarietyList
          // varietyValueMap.values.toList(),
          );
      var result = jsonDecode(response.body);
      successfullyBottomSheet("Temporary Product", result['result']['message'],
          () {
        Navigator.of(context).pop();
      }, context);
      // CommonMethods.customizedAlertDialog(result['result']['message'],
      //     isPop: false);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
