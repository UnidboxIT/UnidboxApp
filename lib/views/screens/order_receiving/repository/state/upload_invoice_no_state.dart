
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_invoice_no_state.freezed.dart';

extension Getters on UploadInvoiceNoState {
  bool get isLoading => this is UploadInvoiceLoading;
}

@freezed
class UploadInvoiceNoState with _$UploadInvoiceNoState{
  const factory UploadInvoiceNoState.initial() = Initial;
  const factory UploadInvoiceNoState.loading() = UploadInvoiceLoading;
  const factory UploadInvoiceNoState.error({String? error}) =
 UploadInvoiceError;
  const factory UploadInvoiceNoState.success({String? sucess}) =
  UploadInvoiceSuccess;
}