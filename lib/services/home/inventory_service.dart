import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../utils/commons/common_method.dart';
import '../api_service.dart';

class InventoryService {
  static Future<Response> inventoryTracker() async {
    http.Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/category?fields=id,name,parent_id,image_url&offset=1',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  // static Future<Response> inventoryTrackerByID(String parentID) async {
  //   http.Response response = await ApiService().get(
  //     url: baseUrl,
  //     endpoint:
  //         'joborder/category?fields=id,name,parent_id,image_url&offset=1&parent_id=$parentID',
  //     headers: CommonMethods.setHeaders(),
  //   );
  //   return response;
  // }
}
