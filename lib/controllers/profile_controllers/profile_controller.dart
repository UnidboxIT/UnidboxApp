import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/models/profile/country.dart';
import 'package:unidbox_app/models/profile/profile.dart';
import 'package:unidbox_app/models/profile/race.dart';
import 'package:unidbox_app/models/profile/religion.dart';
import 'package:unidbox_app/services/profile_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;

import '../../views/widgets/bottom_sheets/successfully_bottom_sheet.dart';

class ProfileController extends GetxController {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtContactNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNationality = TextEditingController();
  TextEditingController txtReligion = TextEditingController();
  TextEditingController txtRace = TextEditingController();

  TextEditingController txtSearch = TextEditingController();

  Profile profile = Profile();
  List<Race> raceList = [];
  List<Religion> religionList = [];
  List<Country> countryList = [];

  Country selectedCountry = Country();
  Race selectedRace = Race();
  Religion selectedReligion = Religion();

  bool isUpdateLoading = false;

  updateSelectedCountryData(values) {
    for (var data in countryList) {
      if (data.name.contains(values)) {
        selectedCountry = Country(id: data.id, name: data.name);
      }
    }
    update();
  }

  updateSelectedRaceData(values) {
    for (var data in raceList) {
      if (data.name.contains(values)) {
        selectedRace = Race(id: data.id, name: data.name);
      }
    }
    update();
  }

  updateSelectedReligionData(values) {
    for (var data in religionList) {
      if (data.name.contains(values)) {
        selectedReligion = Religion(id: data.id, name: data.name);
      }
    }
    update();
  }

  //get profile
  Future<void> getPartnerInfo() async {
    try {
      http.Response response = await ProfileService.profile();
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          profile = Profile.fromJson(result['result']['records'][0]);
          txtFirstName.text = profile.firstName;
          txtLastName.text = profile.lastName;
          txtContactNumber.text = profile.phone;
          txtEmail.text = profile.email;
          txtNationality.text = profile.countryList[1];
          txtReligion.text = profile.religion[1];
          txtRace.text = profile.race[1];
          selectedCountry =
              Country(id: profile.countryList[0], name: profile.countryList[1]);
          selectedRace = Race(id: profile.race[0], name: profile.race[1]);
          selectedReligion =
              Religion(id: profile.religion[0], name: profile.religion[1]);
        } else if (result['result']['code'] == 401) {
          CommonMethods.unAuthorizedLogout();
        } else {
          CommonMethods.customizedAlertDialog(result['result']['message']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }

  //get country
  Future<void> getCoutry() async {
    try {
      http.Response response = await ProfileService.country();
      var result = jsonDecode(response.body);
      countryList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            countryList.add(Country.fromJson(element));
          }
          countryList.sort((a, b) {
            if (a.name == selectedCountry.name) {
              return -1;
            } else if (b.name == selectedCountry.name) {
              return 1;
            } else {
              return a.name
                  .compareTo(b.name); // Sort other elements alphabetically
            }
          });
        } else if (result['result']['code'] == 401) {
          CommonMethods.unAuthorizedLogout();
        } else {
          CommonMethods.customizedAlertDialog(result['result']['message']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }

  //get religion
  Future<void> getReligion() async {
    try {
      http.Response response = await ProfileService.religion();
      var result = jsonDecode(response.body);
      religionList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            religionList.add(Religion.fromJson(element));
          }
        } else if (result['result']['code'] == 401) {
          CommonMethods.unAuthorizedLogout();
        } else {
          CommonMethods.customizedAlertDialog(result['result']['message']);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  //get race
  Future<void> getRace() async {
    try {
      http.Response response = await ProfileService.race();
      var result = jsonDecode(response.body);
      raceList.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            raceList.add(Race.fromJson(element));
          }
        } else if (result['result']['code'] == 401) {
          CommonMethods.unAuthorizedLogout();
        } else {
          CommonMethods.customizedAlertDialog(result['result']['message']);
        }
      }
    } catch (e) {}
  }

  //update profile
  Future<void> updatePartnerInfo() async {
    isUpdateLoading = true;
    update();
    try {
      http.Response response = await ProfileService.updatePartner(
          txtFirstName.text,
          txtLastName.text,
          txtContactNumber.text,
          txtEmail.text,
          selectedCountry.id,
          selectedReligion.id,
          selectedRace.id);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          getPartnerInfo();
          successfullyBottomSheet();
        }
      }
    } catch (e) {
      superPrint(e);
    }
    isUpdateLoading = false;
    update();
  }
}
