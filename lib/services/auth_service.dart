import 'package:get/get.dart';
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../utils/commons/common_method.dart';

class AuthService {
  /*
  Login
  */
  static Future<Response> login(String userID, String password) async {
    Map<String, dynamic> formData = {
      "userid": userID,
      "password": password,
    };
    superPrint(formData);
    Response response = await ApiService().postService(
      url: baseUrl,
      endpoint: 'joborder/login',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}
