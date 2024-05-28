import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/profile/repository/profile_repository.dart';
import 'package:unidbox_app/profile/repository/state/country_state.dart';
import 'package:unidbox_app/profile/repository/state_notifier/country_state_notifier.dart';

import '../state/profile_state.dart';
import '../state_notifier/profile_state_notifier.dart';

final profileStateProvider = StateProvider((ref) {
  return ProfileRepository();
});

final profileStateNotifierProvider =
    StateNotifierProvider<ProfileStateNotifier, ProfileState>(
        (ref) => ProfileStateNotifier(ref.watch(profileStateProvider)));

final countryStateNotifierProvider =
    StateNotifierProvider<CountryStateNotifier, CountryState>(
        (ref) => CountryStateNotifier(ref.watch(profileStateProvider)));
