import 'package:http/http.dart';
import '../../utils/commons/common_method.dart';
import '../api_service.dart';
import 'package:http/http.dart' as http;

class HomeService {
  /*
  My Task
  */
  static Future<Response> myTask() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/mytasks',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  /*
  Ongoing Job
  */
  static Future<Response> ongoingJob() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/detail',
      // 'joborder/detail?fields=partner_id,job_type,deli_postal_code,deli_street&offset=0&limit=80',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  /*
  Selection 
  */
  static Future<Response> selectionField() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'selection/field?fields=job_type&model=job.order',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  // MyTask by id
  static Future<Response> myTaskByID(String parentID) async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/mytasks?parent_id=$parentID',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
