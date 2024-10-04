import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import '../../notification_service/pushy_noti_service.dart';

class AuthRepository {
  Future<http.Response> login(String username, String password) async {
    Map<String, dynamic> formData = {};
    if (pushyToken.isEmpty) {
      formData = {
        "employeeid": username,
        "password": password,
      };
    } else {
      formData = {
        "employeeid": username,
        "password": password,
        "device_token": pushyToken,
      };
    }

    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/login',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );
    return response;
  }

  Future<http.Response> deleteDeviceToken() async {
    Map<String, dynamic> formData = {
      "device_token": pushyToken,
    };
    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/login-token/delete/${admin.uid}',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );
    return response;
  }
}
