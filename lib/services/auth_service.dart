import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;
import '../utils/commons/common_method.dart';

class AuthService {
  /*
  Login
  */
  static Future<http.Response> login(String userID, String password) async {
    Map<String, dynamic> formData = {
      "employeeid": userID,
      "password": password,
    };
    superPrint(formData);
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/login',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );

    return response;
  }
}
