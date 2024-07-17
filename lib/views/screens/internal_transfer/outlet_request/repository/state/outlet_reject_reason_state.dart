import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/outlet_reject_reason.dart';
part 'outlet_reject_reason_state.freezed.dart';

extension Getters on OutletRejectReasonState {
  bool get isLoading => this is RejectLoading;
}

@freezed
class OutletRejectReasonState with _$OutletRejectReasonState {
  const factory OutletRejectReasonState.loadOutletRejectReason(
      List<OutletRejectReason> outletRejectReasonList) = OutletRejectReasonList;
  const factory OutletRejectReasonState.selectedOutletReject(
      OutletRejectReason outletRejectReason) = SelectedOutletRejectReason;
  const factory OutletRejectReasonState.initial() = Initial;
  const factory OutletRejectReasonState.loading() = RejectLoading;
  const factory OutletRejectReasonState.error({String? error}) = RejectError;
}
