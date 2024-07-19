import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/repository/state/my_return_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/repository/state_notifier/my_return_state_notifier.dart';

import '../my_return_repository.dart';

final myReturnProvider = Provider((ref) => MyReturnRepository());

final myReturnStateNotifierProvider =
    StateNotifierProvider<MyReturnStateNotifier, MyReturnState>((ref) {
  return MyReturnStateNotifier(ref.watch(myReturnProvider));
});
