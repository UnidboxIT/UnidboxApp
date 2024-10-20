import 'package:http/http.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';

import '../../../../services/api_service.dart';
import '../../../../utils/commons/common_method.dart';

class OrderReceivingRepository {
  Future<Response> pendingReceiving() async {
    //reason_ids,
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint:
          'joborder/purchase?fields=id,partner_id,date_order,invoice_ids,order_line,amount_total,effective_date,invoice_status,state,name,amount_total,amount_untaxed,amount_tax,invoice_no,delivery_no&user_id=${admin.uid}&state=purchase',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  //Remark
  Future<Response> productReceivedRemark() async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/reason',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }

  Future<Response> uploadInvoice(
      int purchaseID, String invoiceNo, String base64Image, String fileName,
      {bool isDoNumber = false}) async {
    Map<String, dynamic> formData = {};
    if (isDoNumber) {
      formData = {
        "state": "purchase",
        "delivery_no": invoiceNo,
        "del_attachments": [fileName, base64Image]
      };
    } else {
      formData = {
        "state": "purchase",
        "invoice_no": invoiceNo,
        "inv_attachments": [fileName, base64Image]
      };
    }
    superPrint(formData);
    Response response = await ApiService().post(
        url: baseUrl,
        endpoint: 'joborder/purchase-order/update/$purchaseID',
        headers: CommonMethods.setHeaders(),
        formData: formData);

    return response;
  }

  Future<Response> receiveByID(int purchaseID, List receivedLine) async {
    Map<String, dynamic> formData = {
      "state": "done",
      "receive_line": receivedLine,
    };
    superPrint(formData);
    Response response = await ApiService().post(
        url: baseUrl,
        endpoint: 'joborder/purchase-receive/update/$purchaseID',
        headers: CommonMethods.setHeaders(),
        formData: formData);

    return response;
  }

  Future<Response> getReceiveByID(int purchaseID) async {
    Response response = await ApiService().get(
      url: baseUrl,
      endpoint: 'joborder/stock-receive/$purchaseID',
      headers: CommonMethods.setHeaders(),
    );

    return response;
  }
}
