import 'package:http/http.dart';
import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';

class MyReturnRepository {
  Future<Response> myReturn() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&others_request=1',
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
        "comment": comment
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
}
