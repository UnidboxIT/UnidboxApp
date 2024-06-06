import 'package:http/http.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class OtherRequestRepository {
  Future<Response> otherRequest() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-request-list/?sort=id&others_request=1',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
