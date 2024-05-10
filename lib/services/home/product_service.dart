import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';

import '../../utils/commons/common_method.dart';

class ProductService {
  static Future<Response> products(String categoryID, int pageNumber) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=id,name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url&offset=1&sort=id&categ_id=$categoryID',
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
}
