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
          'joborder/product?fields=create_date,id,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,uom_id,rack_ids,full_name,warehouse_id,default_wh_qty&offset=$pageNumber&sort=id&categ_id=$categoryID&limit=20',
      headers: CommonMethods.setHeaders(),
    );
    superPrint(
      'joborder/product?fields=create_date,id,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,uom_id,rack_ids,full_name,warehouse_id,default_wh_qty&offset=$pageNumber&sort=id&categ_id=$categoryID&limit=20',
    );
    superPrint(pageNumber, title: "Page Number");
    return response;
  }

  Future<Response> productByID(String productID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product/$productID?fields=create_date,id,display_name,full_name,categ_id,quantity,brand,default_code,image_url,barcode,qty_warning_out_stock,sale_price,cost_price,model,attributes,barcode_ids,uom_id,rack_ids,warehouse_id,default_wh_qty',
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
          'joborder/product?offset=$pageNumber&limit=10&fields=create_date,id,brand,display_name,full_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,warehouse_id,uom_id,default_wh_qty&barcode=$barcode',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> searchProduct(String name, int pageNumber) async {
    superPrint(pageNumber, title: "Search Product Page Number");
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product-search/?offset=$pageNumber&limit=10&sort=display_name&name=$name&fields=create_date,id,brand,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,full_name,warehouse_id,uom_id,default_wh_qty',
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
    bool isUrgent,
  ) async {
    Map<String, dynamic> formData = {
      "request_to_wh": requestWarehouseID,
      "requested_wh": currentWarehouseID,
      "product_id": productID,
      "date": dateTime,
      "quantity": totalQty,
      "uom_id": uomID,
      "is_urgent": isUrgent,
      "reason_ids": []
    };
    superPrint(formData);
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
    String barcode,
    String salePrice,
    String cost,
    int uomName,
    List attributeList,
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
      "uom_id": uomName,
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
      endpoint: 'joborder/uom?fields=id,name&sort=name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> multiUom() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'selection/field?fields=uom_option&model=other.uom.lines',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> attribute() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product-attributes/?fields=id,name,attribute_value_ids',
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

  Future<Response> insufficientProduct(int pageNumber) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?fields=create_date,id,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,uom_id,rack_ids,full_name,warehouse_id,default_wh_qty&offset=$pageNumber&sort=id&qty_warning_out_stock=0&limit=50',
      headers: CommonMethods.setHeaders(),
    );
    superPrint(pageNumber, title: "Page Number");
    return response;
  }
}
