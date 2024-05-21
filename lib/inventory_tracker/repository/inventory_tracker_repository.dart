import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../services/api_service.dart';
import '../../utils/commons/common_method.dart';

class InventoryTrackerRepository {
  Future<http.Response> inventoryTracker() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/category?fields=id,name,parent_id,image_url&offset=1',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> products(String categoryID, int pageNumber) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=id,name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids&offset=$pageNumber&sort=id&categ_id=$categoryID&limit=20',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> productByID(String productID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product/$productID?fields=id,name,categ_id,quantity,brand,default_code,image_url,barcode,qty_warning_out_stock,sale_price,cost_price,model,attributes,barcode_ids',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
