import 'package:http/http.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';

import '../../../../services/api_service.dart';
import '../../../../utils/commons/common_method.dart';

class OrderReceivingRepository {
  Future<Response> pendingReceiving() async {
    //reason_ids,
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/purchase?fields=id,partner_id,date_order,invoice_ids,order_line,amount_total,effective_date,invoice_status,state&user_id=${admin.uid}&state=purchase',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //Remark
  Future<Response> productReceivedRemark() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/reason?fields=id,name,type&type=receive',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
