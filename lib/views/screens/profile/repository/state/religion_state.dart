import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/profile/domain/religion.dart';
part 'religion_state.freezed.dart';

extension Getters on ReligionState {
  bool get isLoading => this is Loading;
}

@freezed
class ReligionState with _$ReligionState {
  const factory ReligionState.laodReligion(List<Religion> religionList) =
      ReligionList;

  const factory ReligionState.selectedReligion(Religion religion) =
      SelectedReligion;
  const factory ReligionState.initial() = Initial;
  const factory ReligionState.loading() = Loading;
  const factory ReligionState.error({String? error}) = Error;
}
