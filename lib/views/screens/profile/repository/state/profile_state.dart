import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/profile/domain/profile.dart';
part 'profile_state.freezed.dart';

extension Getters on ProfileState {
  bool get isLoading => this is ProfileLoading;
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loadProfile(Profile profile) = ProfileData;
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.error({String? error}) = Error;
}