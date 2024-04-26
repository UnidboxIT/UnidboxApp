import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/models/profile/profile.dart';
import 'package:unidbox_app/services/profile_service.dart';
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

  Profile profile = Profile();

  //get profile
  Future<void> getPartnerInfo() async {
    try {
      http.Response response = await ProfileService.profile();
      var result = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        profile = Profile.fromJson(result['result']['records'][0]);
        txtFirstName.text = profile.firstName;
        txtLastName.text = profile.lastName;
        txtContactNumber.text = profile.phone;
        txtEmail.text = profile.email;
        txtNationality.text = profile.countryList[1];
        txtReligion.text = profile.religion[1];
        txtRace.text = profile.race[1];
      }
    } catch (e) {
      superPrint(e);
    }
    update();
  }

  //get country
  Future<void> getCoutry() async {
    try {} catch (e) {}
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
          txtNationality.text,
          "",
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
