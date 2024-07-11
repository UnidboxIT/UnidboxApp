import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/insufficient_stock_state.dart';
import '../../../../../utils/commons/super_print.dart';

class InsufficientStockStateNotifier
    extends StateNotifier<InsufficientStockState> {
  InsufficientStockStateNotifier(this._inventoryTrackerRepository)
      : super(const InsufficientStockState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Products> insufficientProductList = [];

  Future<void> insufficientStackProduct(int pageNumber) async {
    try {
      if (insufficientProductList.isEmpty) {
        state = const InsufficientStockState.loading();
      }
      Response response =
          await _inventoryTrackerRepository.insufficientProduct(pageNumber);
      superPrint(response.body);
      var result = jsonDecode(response.body);

      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['insufficient'];
        for (var element in dataList) {
          insufficientProductList.add(Products.fromJson(element));
        }
        state = InsufficientStockState.laodProductList(insufficientProductList);
        if (dataList.isEmpty) {
          state = const InsufficientStockState.isDataExist(false);
        }
      }
    } catch (e) {
      state = InsufficientStockState.error(error: e.toString());
      superPrint(e);
    }
  }

  clearProductValue() {
    insufficientProductList.clear();
  }
}
