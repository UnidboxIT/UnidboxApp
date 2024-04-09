import 'package:get_storage/get_storage.dart';

import '../constant/app_constant.dart';

xUserAuthorized() {
  return apiToken.isNotEmpty;
}

class CommonMethods {
  static Map<String, String> setHeaders() {
    var box = GetStorage();

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read(AppKeys.apiToken)}'
    };
  }
}
