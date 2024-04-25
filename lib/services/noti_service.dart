import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/services/api_service.dart';

import '../utils/commons/common_method.dart';

class NotiService {
  /*
  Reminder
  */
  static Future<Response> notiReminder() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/messages?fields=author_id,model,tracking_value_ids,body,record_name,res_id&offset=&limit=10',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
