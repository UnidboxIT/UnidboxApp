import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/scan_product_state.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';
import '../../domain/product.dart';
import '../../presentation/barcode_scanner/scan_product_widget.dart';

class ScanProductStateNotifier extends StateNotifier<ScanProductState> {
  ScanProductStateNotifier(this._inventoryTrackerRepository)
      : super(const ScanProductState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Products> scanProductList = [];

  Future<void> scanProductByBarCode(
    String barcode,
    BuildContext context,
    int pageNumber,
  ) async {
    try {
      if (scanProductList.isEmpty) {
        state = const ScanProductState.loading();
      }
      Response response =
          await _inventoryTrackerRepository.scanProduct(barcode, pageNumber);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        if (result['result']['length'] != 0) {
          for (var element in dataList) {
            scanProductList.add(Products.fromJson(element));
          }
          state = ScanProductState.loadScanProduct(scanProductList);
          if (dataList.isEmpty) {
            state = const ScanProductState.isSearchDataExist(false);
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScanProductScreen(
                  barcode: barcode, scanProductList: scanProductList),
            ),
          );
        } else {
          Navigator.of(context).pop();
          CommonMethods.customizedAlertDialog("No product found!", context);
          state = const ScanProductState.loadScanProduct([]);
          //state = const ScanProductState.error(error: "No product found!");
        }
      }
      superPrint(scanProductList.length);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> scanProductByBarCodePagination(
    String barcode,
    BuildContext context,
    int pageNumber,
  ) async {
    try {
      if (scanProductList.isEmpty) {
        state = const ScanProductState.loading();
      }
      Response response =
          await _inventoryTrackerRepository.scanProduct(barcode, pageNumber);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        if (result['result']['length'] != 0) {
          for (var element in dataList) {
            scanProductList.add(Products.fromJson(element));
          }
          state = ScanProductState.loadScanProduct(scanProductList);
          if (dataList.isEmpty) {
            state = const ScanProductState.isSearchDataExist(false);
          }
        }
      }
      superPrint(scanProductList.length);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> clearScanProduct() async {
    scanProductList.clear();
    superPrint(scanProductList, title: "Provider Clear");
  }
}
