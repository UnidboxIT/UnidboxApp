import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

class TestingNotifier extends StateNotifier<String> {
  TestingNotifier() : super("HELLO");

  void updateValue(String newValue) {
    superPrint("HAY HAY>>>>");
    state = newValue;
    superPrint(state);
    superPrint("HIIHIH>>>>");
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
