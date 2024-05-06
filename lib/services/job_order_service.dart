import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../utils/commons/common_method.dart';
import 'api_service.dart';

class JobOrderService {
  /*
  All JobOrder
  */
  static Future<Response> joborder(String fromDate, String toDate) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/detail?date_from=$fromDate&date_to=$toDate',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  /*
    HandyMan
  */
  static Future<Response> handyman() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/handyman',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  /*
    Driver
  */
  static Future<Response> driver() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/driver',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
