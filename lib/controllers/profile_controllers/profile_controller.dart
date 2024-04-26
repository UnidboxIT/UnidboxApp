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
  Race race = Race();
  Religion religion = Religion();
  List<Country> countryList = [];

  Country selectedCountry = Country();

  updateSelectedCountryData(values) {
    for (var data in countryList) {
      if (data.name.contains(values)) {
        selectedCountry = Country(id: data.id, name: data.name);
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
          update();
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
    try {} catch (e) {}
  }

  //get race
  Future<void> getRace() async {
    try {} catch (e) {}
  }

  //update profile
  Future<void> updatePartnerInfo() async {
    try {
      http.Response response = await ProfileService.updatePartner(
          txtFirstName.text,
          txtLastName.text,
          txtContactNumber.text,
          txtEmail.text,
          selectedCountry.id,
          txtReligion.text,
          txtRace.text);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      superPrint(e);
    }
    update();
  }
}
