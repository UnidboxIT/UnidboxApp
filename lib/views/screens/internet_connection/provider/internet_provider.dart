import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_notifier/connectivity_state_notifier.dart';

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
