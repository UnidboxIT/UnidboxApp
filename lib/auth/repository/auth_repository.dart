import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';

class AuthRepository {
  Future<http.Response> login(String username, String password) async {
    Map<String, dynamic> formData = {
      "employeeid": username,
      "password": password,
    };
    http.Response response = await ApiService().post(
      url: baseUrl,
      endpoint: 'joborder/login',
      headers: CommonMethods.setHeaders(),
      formData: formData,
    );
    print("Response ::: ${response.body}");
    return response;
  }
}
