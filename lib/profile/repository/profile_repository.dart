import 'package:http/http.dart';

import '../../services/api_service.dart';
import '../../utils/commons/common_method.dart';
import '../../utils/constant/app_constant.dart';

class ProfileRepository {
  Future<Response> profile() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/partner/${admin.partnerId}?fields=name,phone,mobile,email,country_id,image_url,race,religion,default_code',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
