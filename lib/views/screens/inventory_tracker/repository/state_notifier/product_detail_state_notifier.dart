import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/product_detail_state.dart';
import '../../domain/product.dart';

class ProductDetailStateNotifier extends StateNotifier<ProductDetailState> {
  ProductDetailStateNotifier(this._inventoryTrackerRepository)
      : super(const ProductDetailState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;
  Products productsDetail = Products();
  Future<void> productByID(String productID) async {
    try {
      state = const ProductDetailState.loading();
      Response response =
          await _inventoryTrackerRepository.productByID(productID);

      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        productsDetail = Products.fromJson(result['result']['records'][0]);
      }
      state = ProductDetailState.loadProductDetail(productsDetail);
    } catch (e) {
      state = ProductDetailState.error(error: e.toString());
    }
  }
}
