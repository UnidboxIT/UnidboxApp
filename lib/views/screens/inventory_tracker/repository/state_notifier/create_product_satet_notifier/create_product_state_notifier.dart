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
      int uomName,
      List attributeList,
      List productVarietyList,
      BuildContext context) async {
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
      state = const CreateProductState.loading();
      Response response = await _inventoryTrackerRepository.createProduct(
          base64Image,
          name,
          model,
          vendor,
          brand,
          barcode,
          salePrice,
          costPrice,
          uomName,
          attributeList,
          productVarietyList);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (response.statusCode == 200) {
        if (result.containsKey('result')) {
          if (result['result']['code'] == 200) {
            successfullyBottomSheet(
                "Temporary Product", result['result']['message'], () {
              Navigator.of(context).pop();
            }, context);
            state = const CreateProductState.success();
          }
        } else if (result.containsKey('error')) {
          successfullyBottomSheet(
              "Temporary Product", result['error']['message'], () {
            Navigator.of(context).pop();
          }, context, isFail: true);
          state = const CreateProductState.error();
        }
      } else {
        successfullyBottomSheet("Temporary Product", result['result']['error'],
            () {
          Navigator.of(context).pop();
        }, context, isFail: true);
        state = const CreateProductState.error();
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  saveImage(String image) {
    state = CreateProductState.saveImage(image);
  }

  clearImage() {
    state = const CreateProductState.clearImage();
  }

  // uomSelected(Uom uom) {
  //   state = CreateProductState.selectedMainUom(uom);
  // }
}
