import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/profile/repository/profile_repository.dart';

import '../state/profile_state.dart';
import '../state_notifier/profile_state_notifier.dart';

final profileStateProvider = StateProvider((ref) {
  return ProfileRepository();
});

final profileStateNotifierProvider =
    StateNotifierProvider<ProfileStateNotifier, ProfileState>(
        (ref) => ProfileStateNotifier(ref.watch(profileStateProvider)));
