import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestingNotifier extends StateNotifier<String> {
  TestingNotifier() : super("HELLO");

  void updateValue(String newValue) {
    state = newValue;
  }
}

final testingProvider = Provider((ref) {
  return TestingNotifier();
});

final testingStateNotifierProvider =
    StateNotifierProvider<TestingNotifier, String>((ref) {
  ref.watch(testingProvider);
  return TestingNotifier();
});
