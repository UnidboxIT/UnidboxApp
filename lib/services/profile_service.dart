import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';
import '../models/login/admin.dart';
import '../utils/commons/common_method.dart';
import '../utils/constant/app_constant.dart';

class ProfileService {
  /*
  get profile data
  */
  static Future<Response> profile() async {
    var box = GetStorage();
    var userJson = jsonDecode(box.read(AppKeys.userInfo));
    admin = Admin.fromJson(userJson);
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/partner/${admin.partnerId}?fields=name,phone,mobile,email,country_id,image_url,race,religion,default_code',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //Update Partner
  static Future<Response> updatePartner(String firstName, String lastName,
      String phone, String email, int countryId, int religion, int race) async {
    var box = GetStorage();
    var userJson = jsonDecode(box.read(AppKeys.userInfo));
    admin = Admin.fromJson(userJson);
    Map<String, dynamic> formData = {
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "country_id": countryId,
      "religion": religion,
      "race": race,
    };
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/partner/update/${admin.partnerId}',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }

  //get country
  static Future<Response> country() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/country',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //get religion
  static Future<Response> religion() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/religion',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //get race
  static Future<Response> race() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/race',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
