import 'dart:convert';

import 'package:get/get.dart';

import '../utils/commons/super_print.dart';

String baseUrl = "http://128.199.107.219:8073/";

class ApiService extends GetConnect {
  Future<Response> postService({
    required String url,
    required String endpoint,
    required Map<String, String> headers,
    required Map<String, dynamic> formData,
  }) async {
    Response response = await post(
      url + endpoint,
      jsonEncode(formData),
      headers: headers,
    );
    superPrint(url + endpoint);
    return response;
  }

  Future<Response> getService({
    required String url,
    required String endpoint,
    required Map<String, String> headers,
  }) async {
    Response response = await get(
      url + endpoint,
      headers: headers,
    );
    superPrint(url + endpoint);
    return response;
  }
}
