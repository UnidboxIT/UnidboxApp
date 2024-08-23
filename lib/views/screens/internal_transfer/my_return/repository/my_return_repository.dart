import 'package:http/http.dart';
import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';

class MyReturnRepository {
  Future<Response> myReturn() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=is_urgent_picking,id,is_return,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&return=my_return',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> returnIssued(List<int> productID) async {
    Map<String, dynamic> formData = {
      "state": "return_issued",
      "ids": productID,
    };
    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> returnRequestReason() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/reason?fields=id,name,type&type=return',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> myReturnStockRequest(
    int requestWarehouseID,
    int currentWarehouseID,
    int productID,
    String productName,
    String dateTime,
    int totalQty,
    double price,
    int uomID,
    List<String> reasonID,
    String comment,
    bool isNewReturn,
  ) async {
    Map<String, dynamic> formData = {};
    if (comment.isNotEmpty) {
      formData = {
        "request_to_wh": requestWarehouseID,
        "requested_wh": currentWarehouseID,
        "product_id": productID,
        "date": dateTime,
        "quantity": totalQty,
        "uom_id": uomID,
        "is_return": true,
        "reason": reasonID,
        "comment": comment,
        "new_request": isNewReturn
      };
    } else {
      formData = {
        "request_to_wh": requestWarehouseID,
        "requested_wh": currentWarehouseID,
        "product_id": productID,
        "date": dateTime,
        "quantity": totalQty,
        "uom_id": uomID,
        "is_return": true,
        "reason": reasonID,
        "new_request": isNewReturn,
      };
    }

    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock/request',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );
    return response;
  }

  Future<Response> scanProduct(String barcode, int pageNumber) async {
    superPrint(pageNumber, title: "Scan Product Page Number");
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product?offset=$pageNumber&limit=10&fields=create_date,id,brand,display_name,full_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,warehouse_id,uom_id,default_wh_qty&barcode=$barcode',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> searchProduct(String name, int pageNumber) async {
    superPrint(pageNumber, title: "Search Product Page Number");
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/product-search/?offset=$pageNumber&limit=10&sort=display_name&name=$name&fields=create_date,id,brand,display_name,default_code,categ_id,barcode,quantity,qty_warning_out_stock,sale_price,image_url,attributes,barcode_ids,full_name,warehouse_id,uom_id,default_wh_qty',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
