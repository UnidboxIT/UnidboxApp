import 'package:http/http.dart';

import '../../services/api_service.dart';
import '../../utils/commons/common_method.dart';
import '../../utils/constant/app_constant.dart';

class UserWarehouseRepository {
  Future<Response> warehouse() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/user/${admin.uid}?fields=id,name,mobile_user_access,warehouse_id',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
