import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/profile/domain/race.dart';
part 'race_state.freezed.dart';

extension Getters on RaceState {
  bool get isLoading => this is Loading;
}

@freezed
class RaceState with _$RaceState {
  const factory RaceState.laodRace(List<Race> raceList) = RaceList;

  const factory RaceState.selectedRace(Race race) = SelectedRace;
  const factory RaceState.initial() = Initial;
  const factory RaceState.loading() = Loading;
  const factory RaceState.error({String? error}) = Error;
}
