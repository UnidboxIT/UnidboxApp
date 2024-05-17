import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeStateNotifier extends StateNotifier<AsyncValue<void>> {
  HomeStateNotifier() : super(const AsyncData(null));
}
