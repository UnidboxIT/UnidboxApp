import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/search_product_state.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../domain/product.dart';

class SearchProductStateNotifier extends StateNotifier<SearchProductState> {
  SearchProductStateNotifier(this._inventoryTrackerRepository)
      : super(const SearchProductState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;
  List<Products> searchProductList = [];

  Future<void> searchProduct(
    String name,
    BuildContext context,
    int pageNumber,
  ) async {
    try {
      if (searchProductList.isEmpty) {
        state = const SearchProductState.loading();
      }
      Response response =
          await _inventoryTrackerRepository.searchProduct(name, pageNumber);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          searchProductList.add(Products.fromJson(element));
        }
        state = SearchProductState.loadSearchProduct(searchProductList);
        if (dataList.isEmpty) {
          state = const SearchProductState.isSearchDataExist(false);
        }
        superPrint(searchProductList.length, title: "Search Product Length");
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> clearSearchProductValue() async {
    searchProductList.clear();
    superPrint(searchProductList, title: "Provider Clear");
  }
}
