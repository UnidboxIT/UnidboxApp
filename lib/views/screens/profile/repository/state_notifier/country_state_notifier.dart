import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/profile/domain/country.dart';
import 'package:unidbox_app/views/screens/profile/repository/profile_repository.dart';
import 'package:unidbox_app/views/screens/profile/repository/state/country_state.dart';
import '../../../../../utils/commons/super_print.dart';

class CountryStateNotifier extends StateNotifier<CountryState> {
  CountryStateNotifier(this._profileRepository)
      : super(const CountryState.initial());

  final ProfileRepository _profileRepository;

  List<Country> countryList = [];
  Future<void> getCountry(String selectedName) async {
    try {
      state = const CountryState.loading();
      Response response = await _profileRepository.country();
      var result = jsonDecode(response.body);
      countryList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            countryList.add(Country.fromJson(element));
          }

          countryList.sort((a, b) {
            if (a.name == selectedName) {
              return -1;
            } else if (b.name == selectedName) {
              return 1;
            } else {
              return a.name
                  .compareTo(b.name); // Sort other elements alphabetically
            }
          });
          state = CountryState.loadCountry(countryList);
        } else {
          state = CountryState.error(error: result['result']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  void eachSelectedCountry(Country country) {
    state = CountryState.selectedCountry(country);
    superPrint(country.name);
  }
}
