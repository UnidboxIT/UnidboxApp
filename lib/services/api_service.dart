import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/utils/commons/common_method.dart';
import '../utils/commons/super_print.dart';

String baseUrl = "http://128.199.107.219:8073/";

class ApiService {
  Future<Response> post({
    required String url,
    required String endpoint,
    required Map<String, String> headers,
    required Map<String, dynamic> formData,
  }) async {
    Response response = await http.post(
      Uri.parse(url + endpoint),
      headers: headers,
      body: jsonEncode(formData),
    );
    superPrint(url + endpoint);
    return response;
  }

  Future<Response> get({
    required String url,
    required String endpoint,
    required Map<String, String> headers,
  }) async {
    Request req = Request('GET', Uri.parse(url + endpoint))
      ..body = "{}"
      ..headers.addAll(CommonMethods.setHeaders());

    // Send the request and get the response
    var streamedResponse = await req.send();
    final response = await http.Response.fromStream(streamedResponse);
    superPrint(response);
    return response;
  }
}
