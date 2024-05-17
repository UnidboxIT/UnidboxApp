import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/auth/presentation/auth_login_screen.dart';
import 'package:unidbox_app/main_screen.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/views/screens/auth_screens/login_screeen.dart';

import 'auth/repository/auth_state_notifier_controller.dart';
import 'utils/constant/app_constant.dart';

class AppScreen extends ConsumerStatefulWidget {
  const AppScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppScreenState();
}

class _AppScreenState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final sharedPrefs = ref.watch(sharedPreferencesProvider);
      apiToken = sharedPrefs.getString(AppKeys.apiToken) ?? "";
    });
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: MediaQuery.of(context)
              .textScaler
              .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.0),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:
              xUserAuthorized() ? const AuthLoginScreen() : const MainScreen(),
        ),
      );
    });
  }
}
