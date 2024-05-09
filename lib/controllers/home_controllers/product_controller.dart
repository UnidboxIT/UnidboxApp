import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/services/home/product_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;
import '../../models/home/product.dart';

class ProductController extends GetxController {
  List<Products> productList = [];
  bool isProductLoading = false;
  List<Products> searchProductsList = [];
  TextEditingController txtSearch = TextEditingController();

  Future<void> searchProductByText(String query) async {
    searchProductsList.clear();
    if (query.isEmpty) {
      searchProductsList.addAll(productList);
    } else {
      searchProductsList = productList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.barcode.toLowerCase().contains(query.toLowerCase()) ||
              element.quantity
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  Future<void> getAllProductsByCategoryID(String categoryID) async {
    if (productList.isEmpty) {
      isProductLoading = true;
      update();
    }
    try {
      http.Response response = await ProductService.products(categoryID);
      var result = jsonDecode(response.body);
      productList.clear();
      searchProductsList.clear();
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          productList.add(Products.fromJson(element));
        }
        for (var data in productList) {
          searchProductsList.add(data);
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isProductLoading = false;
    update();
  }
}
