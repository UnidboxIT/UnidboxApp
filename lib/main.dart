import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/main_screen.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/screens/login_screens/login_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const UnidboxApp());
}

class UnidboxApp extends StatelessWidget {
  const UnidboxApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    apiToken = box.read(AppKeys.apiToken) ?? "";
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(context)
                .textScaler
                .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.0),
          ),
          child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
              useMaterial3: true,
            ),
            home: xUserAuthorized() ? const MainScreen() : const LoginScreen(),
          ),
        );
      },
    );
  }
}
