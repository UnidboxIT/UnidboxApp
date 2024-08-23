import 'package:http/http.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/commons/super_print.dart';

class OutletReturnRepository {
  Future<Response> outletReturn() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=is_urgent_picking,is_return,id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&return=outlet_return',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> returnReceived(int productID) async {
    Map<String, dynamic> formData = {
      "state": "returned",
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

  Future<Response> returnAccepted(int productID) async {
    Map<String, dynamic> formData = {
      "state": "return_accepted",
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
}
