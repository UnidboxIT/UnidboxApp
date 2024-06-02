import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import '../../../../services/api_service.dart';
import '../../../../utils/commons/common_method.dart';

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
          'joborder/product?fields=id,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,uom_id,rack_ids&offset=$pageNumber&sort=id&categ_id=$categoryID&limit=20',
      headers: CommonMethods.setHeaders(),
    );
    superPrint(pageNumber, title: "Page Number");
    return response;
  }

  Future<Response> productByID(String productID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product/$productID?fields=id,display_name,categ_id,quantity,brand,default_code,image_url,barcode,qty_warning_out_stock,sale_price,cost_price,model,attributes,barcode_ids,uom_id,rack_ids',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> inhouseStock(int productID) async {
    superPrint(productID, title: "product id");
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-quant/$productID',
      headers: CommonMethods.setHeaders(),
    );
    return response;
  }

  Future<Response> scanProduct(String barcode, int pageNumber) async {
    superPrint(pageNumber, title: "Scan Product Page Number");
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?offset=$pageNumber&limit=10&fields=id,brand,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids&barcode=$barcode',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> searchProduct(String name, int pageNumber) async {
    superPrint(pageNumber, title: "Search Product Page Number");
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product-search/?offset=$pageNumber&limit=10&sort=display_name&name=$name&fields=id,brand,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> stockRequest(
    int currentWarehouseID,
    int requestWarehouseID,
    int companyID,
    int productID,
    String productName,
    String dateTime,
    int totalQty,
    double price,
    int uomID,
  ) async {
    Map<String, dynamic> formData = {
      "code": "internal",
      "request_to_wh": currentWarehouseID,
      "requested_wh": requestWarehouseID,
      "company_id": companyID,
      "product_id": productID,
      "name": productName,
      "date": dateTime,
      "quantity": totalQty,
      "price": price,
      "uom_id": uomID
    };
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock/request',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> checkout(
    int companyID,
    int partnerID,
    String dateTime,
    List orderLine,
  ) async {
    Map<String, dynamic> formData = {
      "user_id": admin.uid,
      "company_id": companyID,
      "partner_id": partnerID,
      "date": dateTime,
      "order_line": orderLine,
    };
    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/purchase-order/create',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> stockOrder(int productID) async {
    superPrint(productID);
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-supplier/$productID',
      headers: CommonMethods.setHeaders(),
    );
    superPrint(response.body);
    return response;
  }

  Future<Response> racks() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/racks',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> updateProduct(String productID, List rackList,
      String salePrice, String costPrice) async {
    Map<String, dynamic> formData = {
      "racks": rackList,
      "sale_price": salePrice,
      "cost_price": costPrice
    };
    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/product/update/$productID',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> createProduct(
    String image,
    String name,
    String model,
    String vendor,
    String brand,
    String uomName,
    String barcode,
    String salePrice,
    String cost,
    List attributeList,
    List productVarietyList,
  ) async {
    Map<String, dynamic> formData = {
      "image": image,
      "name": name,
      "model": model,
      "vendor": vendor,
      "brand": brand,
      "uom_option": uomName,
      "barcode": barcode,
      "sale_price": salePrice,
      "cost_price": cost,
      "variety": productVarietyList,
      "attributes": attributeList,
    };

    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/product/create',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> uom() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/uom?fields=id,name&offset=0&sort=name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> attribute() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/product-attributes/?fields=id,name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> attributeByID(String id) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/product-attribute-value/$id?fields=id,name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
