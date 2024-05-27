import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/inventory_tracker/repository/state/product_state.dart';
import '../../domain/inhouse_stock.dart';
import '../../domain/product.dart';

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
}
