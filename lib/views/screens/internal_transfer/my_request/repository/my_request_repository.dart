import 'package:http/http.dart';
import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class MyRequestRepository {
  Future<Response> myrequest() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&others_request=0',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> done(int productID, int qty) async {
    Map<String, dynamic> formData = {"state": "done", "received_qty": qty};
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/stock-request/update/$productID',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}
