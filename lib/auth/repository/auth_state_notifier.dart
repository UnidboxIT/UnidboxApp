import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/auth/repository/auth_repository.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../home/presentation/home_screen.dart';
import '../../models/login/admin.dart';
import '../../utils/constant/app_constant.dart';

final authSateProvider = StateProvider((ref) => AuthRepository());

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final isCheckRememberMeProvider = Provider<bool>((ref) {
  return false;
});

final authStateNotifierControllerProvider =
    StateNotifierProvider<AuthStateNotifierController, AsyncValue>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final authController = ref.watch(authSateProvider);
  final isCheckController = ref.watch(isCheckRememberMeProvider);
  return AuthStateNotifierController(
      authController, sharedPreferences, isCheckController);
});

class AuthStateNotifierController extends StateNotifier<AsyncValue<void>> {
  AuthStateNotifierController(
      this._authRepository, this.sharedPreferences, this.isSelected)
      : super(const AsyncValue.data(null));
  final AuthRepository _authRepository;
  final SharedPreferences sharedPreferences;
  bool isSelected;

  void signIn(String username, String password, BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      http.Response response = await _authRepository.login(username, password);
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['result']['code'] == 200) {
        Admin adminData = Admin.fromJson(result['result']);
        saveLogin(adminData.sessionId, result['result']);
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      } else {
        state = AsyncValue.error(result['result']['error'], StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error('Could not place order', StackTrace.current);
    } finally {
      state = const AsyncValue.data(null);
    }
  }

  void saveLogin(String apiToken, result) async {
    sharedPreferences.setString(AppKeys.apiToken, apiToken);
    sharedPreferences.setString(AppKeys.userInfo, jsonEncode(result));
  }

  void selectedCheckBox(bool selected) {
    isSelected = selected;
  }

  checkUserAuthorization() {
    apiToken = sharedPreferences.getString('apiToken') ?? '';
    return apiToken.isNotEmpty;
  }

  Admin getAdminInfo() {
    var data = jsonDecode(sharedPreferences.getString(AppKeys.userInfo)!);
    admin = Admin.fromJson(data);
    superPrint(admin.name);
    return admin;
  }
}
