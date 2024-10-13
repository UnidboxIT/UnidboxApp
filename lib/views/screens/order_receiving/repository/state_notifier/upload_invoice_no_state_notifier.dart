import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/order_receiving_repository.dart';
import 'package:unidbox_app/views/screens/order_receiving/repository/state/upload_invoice_no_state.dart';

import '../../../../../utils/commons/super_print.dart';

class UploadInvoiceNoStateNotifier extends StateNotifier<UploadInvoiceNoState> {
  UploadInvoiceNoStateNotifier(this._orderReceivingRepository)
      : super(const UploadInvoiceNoState.initial());
  final OrderReceivingRepository _orderReceivingRepository;

  Future<void> uploadInvoiceByID(
      int purchaseID, String invoiceNo, String base64Image) async {
    state = const UploadInvoiceNoState.loading();
    try {
      Response response = await _orderReceivingRepository.uploadInvoice(
        purchaseID,
        invoiceNo,
        base64Image,
      );
      superPrint(response.body);
      var result = jsonDecode(response.body);
      state = const UploadInvoiceNoState.success();
      superPrint(response.body);
    } catch (e) {
      state = const UploadInvoiceNoState.error();
      superPrint(e.toString());
    }
  }
}
