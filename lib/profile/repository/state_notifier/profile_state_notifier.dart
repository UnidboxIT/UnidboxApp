import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/profile/repository/profile_repository.dart';
import 'package:unidbox_app/profile/repository/state/profile_state.dart';
import '../../../utils/commons/super_print.dart';
import '../../../views/widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../../domain/profile.dart';

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  ProfileStateNotifier(this._profileRepository)
      : super(const ProfileState.initial());

  final ProfileRepository _profileRepository;

  Profile profile = Profile();

  Future<void> getPartnerInfo() async {
    try {
      state = const ProfileState.loading();
      Response response = await _profileRepository.profile();
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          profile = Profile.fromJson(result['result']['records'][0]);
          superPrint(profile);
          state = ProfileState.loadProfile(profile);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  Future<void> imageUpload(String image, context) async {
    try {
      state = const ProfileState.loading();
      Response response = await _profileRepository.imageUpdate(image);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          getPartnerInfo();
          successfullyBottomSheet(
              "Successfully Updated", "The informations have been updated", () {
            Navigator.of(context).pop();
          }, context);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }

  //update profile
  Future<void> updatePartnerInfo(
      String firstName,
      String lastName,
      String phone,
      String email,
      int countryId,
      int religion,
      int race,
      BuildContext context) async {
    try {
      superPrint("HERE");
      state = const ProfileState.loading();
      Response response = await _profileRepository.updatePartner(
          firstName, lastName, phone, email, countryId, religion, race);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          getPartnerInfo();
          successfullyBottomSheet(
              "Successfully Updated", "The informations have been updated", () {
            Navigator.of(context).pop();
          }, context);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }
}
