import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/services/api_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/auth/presentation/auth_login_screen.dart';
import 'package:unidbox_app/views/screens/auth/repository/auth_repository.dart';
import 'package:unidbox_app/main_screen.dart';
import '../domain/admin.dart';
import '../../../../utils/commons/common_method.dart';
import '../../../../utils/constant/app_constant.dart';
import 'state/auth_state.dart';

final authSateProvider = StateProvider((ref) => AuthRepository());

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final isCheckRememberMeProvider = Provider<bool>((ref) {
  return false;
});

final authStateNotifierControllerProvider =
    StateNotifierProvider<AuthStateNotifierController, AuthState>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final authController = ref.watch(authSateProvider);
  final isCheckController = ref.watch(isCheckRememberMeProvider);
  return AuthStateNotifierController(
      authController, sharedPreferences, isCheckController);
});

class AuthStateNotifierController extends StateNotifier<AuthState> {
  AuthStateNotifierController(
      this._authRepository, this.sharedPreferences, this.isSelected)
      : super(const AuthState.initial());
  final AuthRepository _authRepository;
  final SharedPreferences sharedPreferences;
  bool isSelected;

  Future<void> signIn(String username, String password, WidgetRef ref,
      BuildContext context, isCheck) async {
    try {
      state = const AuthState.loading();
      http.Response response = await _authRepository.login(username, password);
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Admin adminData = Admin.fromJson(result['result']);
          saveLogin(adminData.sessionId, result['result']);
          // if (context.mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
          // }
          state = const AuthState.success();
        } else {
          CommonMethods.customizedAlertDialog(
            result['result']['error'],
            context,
          );
          state = AuthState.error(result['result']['error'].toString());
        }
      }
    } catch (e) {
      state = const AuthState.error('Could not place order');
    }
  }

  void saveLogin(String apiToken, result) async {
    sharedPreferences.setString(AppKeys.apiToken, apiToken);
    sharedPreferences.setString(AppKeys.userInfo, jsonEncode(result));
  }

  void saveDomain(String baseUrl) async {
    sharedPreferences.setString(AppKeys.domain, baseUrl);
  }

  void selectedCheckBox(bool selected) {
    isSelected = selected;
  }

  checkUserAuthorization() {
    apiToken = sharedPreferences.getString('apiToken') ?? '';
    return apiToken.isNotEmpty;
  }

  Admin getAdminInfo() {
    admin = Admin.fromJson(
        jsonDecode(sharedPreferences.getString(AppKeys.userInfo) ?? ""));
    return admin;
  }

  retrieveDomainName() {
    baseUrl = sharedPreferences.getString(AppKeys.domain) ?? "";
    superPrint(baseUrl);
  }

  void logout(BuildContext context, WidgetRef ref) {
    rememberMe(
        sharedPreferences.getString(AppKeys.userName) ?? "",
        sharedPreferences.getString(AppKeys.password) ?? "",
        sharedPreferences.getBool("isRemember") ?? false);
    deleteDeviceToken(context);
    sharedPreferences.remove(AppKeys.apiToken);
    sharedPreferences.remove(AppKeys.userInfo);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthLoginScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  void deleteDeviceToken(BuildContext context) async {
    try {
      state = const AuthState.loading();

      http.Response response = await _authRepository.deleteDeviceToken();
      Map<String, dynamic> result = jsonDecode(response.body);

      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          state = const AuthState.success();
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          CommonMethods.customizedAlertDialog(
            result['error']['data']['message'],
            context,
          );
          state = AuthState.error(result['result']['error'].toString());
        }
      }
    } catch (e) {
      state = const AuthState.error('Could not place order');
    }
  }

  rememberMe(String name, String password, bool isCheck) {
    if (isCheck) {
      sharedPreferences.setString(AppKeys.userName, name);
      sharedPreferences.setString(AppKeys.password, password);
      sharedPreferences.setBool("isRemember", isCheck);
      state = AuthState.rememberMe(name, password, isCheck);
    } else {
      sharedPreferences.remove(AppKeys.userName);
      sharedPreferences.remove(AppKeys.password);
      sharedPreferences.remove("isRemember");
      state = const AuthState.rememberMe("", "", false);
    }
  }
}
