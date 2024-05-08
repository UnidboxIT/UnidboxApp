import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../utils/commons/common_method.dart';
import 'api_service.dart';

class InventoryService {
  static Future<Response> inventoryTracker() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/category?fields=id,name,parent_id&offset=1&parent_id=',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
