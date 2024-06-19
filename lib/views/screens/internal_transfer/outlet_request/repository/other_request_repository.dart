import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class OtherRequestRepository {
  Future<Response> otherRequest() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&others_request=1',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> warehouse() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/warehouse?fields=id,name',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> accepted(int productID) async {
    Map<String, dynamic> formData = {
      "state": "accepted",
      "ids": [productID]
    };
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> packed(int productID, double qty) async {
    Map<String, dynamic> formData = {
      "state": "packed",
      "qty": qty,
      "ids": [productID]
    };
    superPrint(formData, title: "Packed Product");
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> issued(List<int> productID) async {
    Map<String, dynamic> formData = {
      "state": "issued",
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
}
