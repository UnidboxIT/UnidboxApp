import 'dart:convert';
import 'package:get/get.dart';
import '../../models/home/inhouse_stock.dart';
import '../../models/home/product.dart';
import '../../services/home/product_service.dart';
import 'package:http/http.dart' as http;
import '../../utils/commons/super_print.dart';

class ProductDetailController extends GetxController {
  Products productsDetail = Products();
  String stockName = "In-house Stock";
  List<InhouseStock> inhouseStockList = [];
  void toggleInHouseStockButton(String name) {
    stockName = name;
    update();
  }

  Future<void> productByID(String productID) async {
    try {
      http.Response response = await ProductService.productByID(productID);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        productsDetail = Products.fromJson(result['result']['records'][0]);
        superPrint(productsDetail.name);
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }

  Future<void> inHouseStockByProductID(String productID) async {
    try {
      http.Response response = await ProductService.inHouseStock(productID);
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['result'];
        inhouseStockList.clear();
        for (var element in dataList) {
          inhouseStockList.add(InhouseStock.fromJson(element));
        }
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }
}
