import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/profile/domain/country.dart';
part 'country_state.freezed.dart';

extension Getters on CountryState {
  bool get isLoading => this is Loading;
}

@freezed
class CountryState with _$CountryState {
  const factory CountryState.loadCountry(List<Country> countryList) =
      CountryList;

  const factory CountryState.selectedCountry(Country country) = SelectedCountry;
  const factory CountryState.initial() = Initial;
  const factory CountryState.loading() = Loading;
  const factory CountryState.error({String? error}) = Error;
}
