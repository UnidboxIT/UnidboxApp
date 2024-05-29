// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import '../../../services/home/product_service.dart';
// import 'package:http/http.dart' as http;
// import '../../../utils/commons/super_print.dart';

// class ProductDetailController extends GetxController {
//   bool isInHouseLoading = false;
//   List<Racks> racksList = [];

//   TextEditingController txtSearch = TextEditingController();
//   TextEditingController txtRetailPrice = TextEditingController();
//   TextEditingController txtCostPrice = TextEditingController();

//   Racks selectedRackValue = Racks();
//   String inHouseQty = "";

//   // void toggleInHouseStockButton(String name) {
//   //   stockName = name;
//   //   update();
//   // }

//   // addRetailPriceCostPrice(String retailPrice, String costPrice) {
//   //   txtRetailPrice.text = retailPrice;
//   //   txtCostPrice.text = costPrice;
//   // }

//   updateSelectedRacksData(values) {
//     for (var data in racksList) {
//       if (data.name.contains(values)) {
//         selectedRackValue = Racks(id: data.id, name: data.name);
//       }
//     }
//     update();
//   }

//   // Future<void> productByID(String productID) async {
//   //   try {
//   //     http.Response response = await ProductService.productByID(productID);
//   //     var result = jsonDecode(response.body);
//   //     if (result['result']['code'] == 200) {
//   //       productsDetail = Products.fromJson(result['result']['records'][0]);
//   //       superPrint(productsDetail.name);
//   //     }
//   //   } catch (e) {
//   //     superPrint(e);
//   //   }
//   //   update();
//   // }

//   // Future<void> inHouseStockByProductID(String productID) async {
//   //   isInHouseLoading = true;
//   //   update();
//   //   try {
//   //     http.Response response = await ProductService.inHouseStock(productID);
//   //     var result = jsonDecode(response.body);
//   //     superPrint(result);
//   //     if (result['result']['code'] == 200) {
//   //       Iterable dataList = result['result']['result'];
//   //       inhouseStockList.clear();
//   //       for (var element in dataList) {
//   //         inhouseStockList.add(InhouseStock.fromJson(element));
//   //       }
//   //     }
//   //   } catch (e) {
//   //     superPrint(e);
//   //   }
//   //   isInHouseLoading = false;
//   //   update();
//   // }

//   Future<void> getAllRacks() async {
//     try {
//       http.Response response = await ProductService.racks();
//       var result = jsonDecode(response.body);
//       superPrint(result);
//       racksList.clear();
//       if (result['result']['code'] == 200) {
//         Iterable dataList = result['result']['records'];
//         for (var element in dataList) {
//           racksList.add(Racks.fromJson(element));
//         }
//       }
//     } catch (e) {
//       superPrint(e);
//     }
//     update();
//   }

//   Future<void> updateProductDetail(String productID) async {
//     try {
//       http.Response response = await ProductService.updateProduct(
//           productID, [], txtRetailPrice.text, txtCostPrice.text);
//       var result = jsonDecode(response.body);
//       racksList.clear();
//       if (result['result']['code'] == 200) {
//         Iterable dataList = result['result']['records'];
//         for (var element in dataList) {
//           racksList.add(Racks.fromJson(element));
//         }
//       }
//     } catch (e) {
//       superPrint(e);
//     }
//     update();
//   }
// }
