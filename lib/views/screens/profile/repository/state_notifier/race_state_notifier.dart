import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/profile/domain/race.dart';
import 'package:unidbox_app/views/screens/profile/repository/profile_repository.dart';
import 'package:unidbox_app/views/screens/profile/repository/state/race_state.dart';
import '../../../../../utils/commons/super_print.dart';

class RaceStateNotifier extends StateNotifier<RaceState> {
  RaceStateNotifier(this._profileRepository) : super(const RaceState.initial());

  final ProfileRepository _profileRepository;

  List<Race> raceList = [];
  Future<void> getRace(String selectedName) async {
    try {
      state = const RaceState.loading();
      Response response = await _profileRepository.race();
      var result = jsonDecode(response.body);
      raceList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            raceList.add(Race.fromJson(element));
          }
          state = RaceState.laodRace(raceList);
        } else {
          state = RaceState.error(error: result['result']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  void eachSelectedCountry(Race race) {
    state = RaceState.selectedRace(race);
    superPrint(race.name);
  }
}
