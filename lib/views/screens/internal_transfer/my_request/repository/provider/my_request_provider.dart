import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/my_request_repository.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state_notifier/my_request_state_notifier.dart';

final myReqestProvider = Provider((ref) => MyRequestRepository());

final myRequestStateNotifierProvider =
    StateNotifierProvider<MyRequestStateNotifier, MyRequestState>(
        (ref) => MyRequestStateNotifier(ref.watch(myReqestProvider)));
