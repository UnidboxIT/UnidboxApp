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

  //get religion
  Future<Response> religion() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/religion',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //get race
  Future<Response> race() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/race',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //Update Partner
  Future<Response> updatePartner(String firstName, String lastName,
      String phone, String email, int countryId, int religion, int race) async {
    Map<String, dynamic> formData = {
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "country_id": countryId,
      "religion": religion,
      "race": race,
    };
    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/partner/update/${admin.partnerId}',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  /*
  Change Password
  */
  Future<Response> changePassword(
      String oldPwd, String newPwd, String confirmPwd) async {
    Map<String, dynamic> formData = {
      "old_password": oldPwd,
      "new_password": newPwd,
      "confirm_password": confirmPwd,
    };

    Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/partner/change-password',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}
