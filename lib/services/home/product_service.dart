import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../../utils/commons/common_method.dart';

class ProductService {
  static Future<Response> products(String categoryID, int pageNumber) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=id,name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url&offset=$pageNumber&sort=id&categ_id=$categoryID&limit=20',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  static Future<Response> scanProduct(String barcode) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=id,name,default_code,categ_id,barcode,price,quantity&barcode=$barcode',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  static Future<Response> createProduct(
    String image,
    String name,
    String model,
    String vendor,
    String brand,
    String barcode,
    String salePrice,
    String cost,
    List productVarietyList,
  ) async {
    Map<String, dynamic> formData = {
      "image": image,
      "name": name,
      "model": model,
      "vendor": vendor,
      "brand": brand,
      "barcode": barcode,
      "sale_price": salePrice,
      "cost_price": cost,
      "variety": productVarietyList
    };
    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/product/create',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  static Future<Response> uom(int offset, int limit) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/uom?fields=id,name&offset=$offset&limit=$limit&sort=name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  static Future<Response> productByID(String productID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product/$productID?fields=id,name,categ_id,quantity,brand,default_code,image_url,barcode,qty_warning_out_stock,sale_price,cost_price,model',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  static Future<Response> inHouseStock(String productID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-quant/$productID',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
