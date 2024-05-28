import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/profile/domain/religion.dart';
import 'package:unidbox_app/views/screens/profile/repository/profile_repository.dart';
import 'package:unidbox_app/views/screens/profile/repository/state/religion_state.dart';
import '../../../../../utils/commons/super_print.dart';

class ReligionStateNotifier extends StateNotifier<ReligionState> {
  ReligionStateNotifier(this._profileRepository)
      : super(const ReligionState.initial());

  final ProfileRepository _profileRepository;

  List<Religion> religionList = [];
  Future<void> getReligion(String selectedName) async {
    try {
      state = const ReligionState.loading();
      Response response = await _profileRepository.religion();
      var result = jsonDecode(response.body);
      religionList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            religionList.add(Religion.fromJson(element));
          }
          state = ReligionState.laodReligion(religionList);
        } else {
          state = ReligionState.error(error: result['result']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  void eachSelectedReligion(Religion religion) {
    state = ReligionState.selectedReligion(religion);
    superPrint(religion.name);
  }
}
