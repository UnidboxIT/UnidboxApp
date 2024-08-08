import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class MyRequestRepository {
  Future<Response> myrequest() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=reason_ids,is_return,id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&others_request=0',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> done(int productID, int qty) async {
    Map<String, dynamic> formData = {
      "state": "received",
      "qty": qty,
      "ids": [productID],
    };
    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> requestUpdate(int productID, int qty) async {
    Map<String, dynamic> formData = {
      "state": "updated",
      "qty": qty,
      "ids": [productID],
    };
    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> receivedByImage(int productID, int qty,
      List<String> reasonIdList, String otherComment, List imageList) async {
    Map<String, dynamic> formData = {};
    if (otherComment.isNotEmpty) {
      formData = {
        "state": "received",
        "qty": qty,
        "ids": [productID],
        "reason": reasonIdList,
        "comment": otherComment,
        "img_name": "picking_$productID.png",
        "images": imageList,
      };
    } else {
      formData = {
        "state": "received",
        "qty": qty,
        "ids": [productID],
        "reason": reasonIdList,
        "images": imageList,
      };
    }

    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> returnRequestReason() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/reason?fields=id,name,type&type=receive',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> remove(int productID) async {
    Map<String, dynamic> formData = {
      "ids": [productID],
      "remove_reject": true,
    };
    superPrint(formData);
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}
