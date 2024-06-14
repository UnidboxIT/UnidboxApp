import 'package:http/http.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class OutletReturnRepository {
  Future<Response> outletReturn() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/stock-request-list/?fields=id,name,date,move_lines,request_to_wh,int_status,user_id&sort=id&others_request=1',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
