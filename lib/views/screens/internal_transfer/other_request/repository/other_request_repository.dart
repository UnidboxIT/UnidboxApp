import 'package:http/http.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class OtherRequestRepository {
  Future<Response> otherRequest(int offset) async {
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
    Map<String, dynamic> formData = {"state": "accepted"};
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/$productID',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  Future<Response> packed(int productID) async {
    Map<String, dynamic> formData = {"state": "packed"};
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/$productID',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}