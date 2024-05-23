import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_state.dart';
import '../../../utils/commons/common_method.dart';
import '../../../utils/commons/super_print.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';
import '../../presentation/product_screen.dart';

class ProductStateNotifier extends StateNotifier<ProductState> {
  ProductStateNotifier(this._inventoryTrackerRepository)
      : super(const ProductState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;
  List<Products> productList = [];
  List<Products> scanProductList = [];

  List<InhouseStock> inHouseStockList = [];
  Future<void> getAllProductsByCategoryID(
    String categoryID,
    int pageNumber,
  ) async {
    try {
      if (productList.isEmpty) {
        state = const ProductState.loading();
      }
      Response response =
          await _inventoryTrackerRepository.products(categoryID, pageNumber);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          productList.add(Products.fromJson(element));
        }
        state = ProductState.loadProduct(productList);
        if (dataList.isEmpty) {
          state = const ProductState.isDataExist(false);
        }
      }
    } catch (e) {
      state = ProductState.error(error: e.toString());
    }
  }

  clearProductValue() {
    productList.clear();
  }

  Future<void> scanProductByBarCode(
      String barcode, BuildContext context) async {
    try {
      state = const ProductState.loading();
      Response response =
          await _inventoryTrackerRepository.scanProduct(barcode);
      var result = jsonDecode(response.body);
      scanProductList.clear();
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            scanProductList.add(Products.fromJson(element));
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                  name: scanProductList[0].brand,
                  parentID: scanProductList[0].categoryIdList[0].toString(),
                  isScanBarCode: true,
                  productList: scanProductList),
            ),
          );
          state = ProductState.loadProduct(scanProductList);
        } else {
          Navigator.of(context).pop();
          CommonMethods.customizedAlertDialog("No product found!", context);
          state = const ProductState.error(error: "No product found!");
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
