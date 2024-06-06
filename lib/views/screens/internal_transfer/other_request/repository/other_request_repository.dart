import 'package:http/http.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class OtherRequestRepository {
  Future<Response> otherRequest(int offset) async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&limit=10&offset=$offset&sort=id&others_request=1',
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
}
