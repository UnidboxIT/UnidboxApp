import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/auth/repository/auth_state_notifier.dart';
import 'package:unidbox_app/views/screens/profile/repository/profile_repository.dart';

import '../../../../../utils/commons/super_print.dart';
import '../../../../widgets/bottom_sheets/successfully_bottom_sheet.dart';
import '../state/change_pwd_state.dart';

class ChangePwdStateNotifier extends StateNotifier<ChangePwdState> {
  ChangePwdStateNotifier(this._profileRepository)
      : super(const ChangePwdState.initial());

  final ProfileRepository _profileRepository;

  Future<void> changePwd(String oldPwd, String newPwd, String confrimPwd,
      BuildContext context, WidgetRef ref) async {
    try {
      state = const ChangePwdState.loading();
      Response response =
          await _profileRepository.changePassword(oldPwd, newPwd, confrimPwd);
      var result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        successfullyBottomSheet(
            "Successfully Updated", "The informations have been updated", () {
          Navigator.of(context).pop();
          ref.read(authStateNotifierControllerProvider.notifier).logout(
                context,
                ref,
              );
        }, context);
        state = const ChangePwdState.success("Successfully Updated");
        // successfullyBottomSheet(
        //     "Successfully Updated", "The informations have been updated", () {
        //   // var userJson = jsonDecode(box.read(AppKeys.userInfo));
        //   //   admin = Admin.fromJson(userJson);
        //   var loginController = Get.find<LoginController>();
        //   loginController.txtUserID.text = admin.username;
        //   loginController.txtPassword.clear();
        //   Get.offAll(() => const LoginScreen());
        // });
      } else {}
      FocusManager.instance.primaryFocus!.unfocus();
    } catch (e) {
      superPrint(e);
    }
  }
}
