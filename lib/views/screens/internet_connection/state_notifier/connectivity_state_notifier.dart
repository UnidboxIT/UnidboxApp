import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../state/connection_status.dart';

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.NotDetermined;

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      superPrint(connectivityResult);
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        newState = ConnectivityStatus.isConnected;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        newState = ConnectivityStatus.isConnected;
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        newState = ConnectivityStatus.isDisonnected;
      }
      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}
