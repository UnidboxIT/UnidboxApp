import 'package:http/http.dart';
import '../utils/commons/common_method.dart';
import 'api_service.dart';
import 'package:http/http.dart' as http;

class HomeService {
  /*
  Login
  */
  static Future<Response> ongoingJob() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/detail?fields=partner_id,job_type&offset=0&limit=80',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
