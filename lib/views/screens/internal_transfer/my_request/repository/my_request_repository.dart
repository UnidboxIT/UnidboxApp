import 'package:http/http.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';

import '../../../../../services/api_service.dart';
import '../../../../../utils/commons/common_method.dart';

class MyRequestRepository {
  Future<Response> myrequest() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-request/${admin.uid}',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
