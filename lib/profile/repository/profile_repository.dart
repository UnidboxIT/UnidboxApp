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

  //image update
  Future<Response> imageUpdate(String image) async {
    Map<String, dynamic> formData = {"image_1920": image};
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/partner/update/${admin.partnerId}',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  //get country
  Future<Response> country() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/country',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
