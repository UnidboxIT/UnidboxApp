import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home_repository.dart';
import '../state/home_state.dart';
import '../state_notifier/home_state_notifier.dart';

final homeStateProvider = StateProvider((ref) => HomeRepository());

final homeStateNotifierProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier(ref.watch(homeStateProvider));
});
