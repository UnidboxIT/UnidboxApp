import 'package:http/http.dart';
import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class MyRequestRepository {
  Future<Response> myrequest(int offset) async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&limit=10&offset=$offset&sort=id',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
