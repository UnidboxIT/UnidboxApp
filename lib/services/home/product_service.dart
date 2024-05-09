import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';

import '../../utils/commons/common_method.dart';

class ProductService {
  static Future<Response> products(String categoryID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=id,name,default_code,categ_id,barcode,price,quantity&offset=1&sort=id&categ_id=$categoryID',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
