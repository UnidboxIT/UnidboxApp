import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/warehouse_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/other_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/accepted_product_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/other_request_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state/outlet_reject_reason_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state_notifier/accepted_product_state_notifier.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state_notifier/outlet_reject_reason_state_notifier.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/state_notifier/warehouse_state_notifier.dart';

import '../state_notifier/other_request_state_notifier.dart';

final otherReqestProvider = Provider((ref) => OtherRequestRepository());

final otherRequestStateNotifierProvider =
    StateNotifierProvider<OtherRequestStateNotifier, OtherRequestState>(
        (ref) => OtherRequestStateNotifier(ref.watch(otherReqestProvider)));

final warehouseStateNotifierProvider =
    StateNotifierProvider<WarehouseStateNotifier, WarehouseState>(
        (ref) => WarehouseStateNotifier(ref.watch(otherReqestProvider)));

final acceptedStateNotifierProvider =
    StateNotifierProvider<AcceptedProductStateNotifier, AcceptedProductState>(
        (ref) => AcceptedProductStateNotifier());

final outletRejectReasonStateNotifierProvider = StateNotifierProvider<
        OutletRejectReasonStateNotifier, OutletRejectReasonState>(
    (ref) => OutletRejectReasonStateNotifier(ref.watch(otherReqestProvider)));
