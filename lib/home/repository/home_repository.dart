import 'package:http/http.dart' as http;
import '../../services/api_service.dart';
import '../../utils/commons/common_method.dart';

class HomeRepository {
  Future<http.Response> reminder() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/messages?fields=author_id,model,tracking_value_ids,body,record_name,res_id&offset=&limit=10',
      headers: CommonMethods.setHeaders(),
    );
    return response;
  }
}
