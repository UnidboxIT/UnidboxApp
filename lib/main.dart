import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/app_screen.dart';
import 'views/screens/auth/repository/auth_state_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const AppScreen(),
    ),
  );

  // await GetStorage.init();
  //runApp(const UnidboxApp());
  // Get.config(
  //   enableLog: true,
  //   defaultPopGesture: true,
  //   defaultTransition: Transition.cupertino,
  // );
}

// class UnidboxApp extends StatelessWidget {
//   const UnidboxApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(NavBarController());
//     Get.put(LoginController());
//     var box = GetStorage();
//     apiToken = box.read(AppKeys.apiToken) ?? "";
//     return ResponsiveSizer(
//       builder: (context, orientation, screenType) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(
//             textScaler: MediaQuery.of(context)
//                 .textScaler
//                 .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.0),
//           ),
//           child: GetMaterialApp(
//             title: 'Flutter Demo',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
//               useMaterial3: true,
//             ),
//             home: xUserAuthorized() ? const MainScreen() : const LoginScreen(),
//             defaultTransition: Transition.circularReveal,
//             transitionDuration: Get.defaultDialogTransitionDuration,
//             enableLog: true,
//             opaqueRoute: Get.isOpaqueRouteDefault,
//             popGesture: Get.isPopGestureEnable,
//           ),
//         );
//       },
//     );
//   }
// }
