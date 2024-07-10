import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/auth/presentation/auth_login_screen.dart';
import 'package:unidbox_app/main_screen.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'main.dart';
import 'views/screens/internet_connection/provider/internet_provider.dart';
import 'views/screens/internet_connection/state/connection_status.dart';
import 'views/screens/notification_service/pushy_noti_service.dart';

class AppScreen extends ConsumerStatefulWidget {
  const AppScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppScreenState();
}

class _AppScreenState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(connectivityStatusProviders) ==
        ConnectivityStatus.isConnected) {
      pushyRegister(backgroundNotificationListener);
    }
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UnidboxApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: xCheckUserAuthorized(ref)
            ? const MainScreen()
            : const AuthLoginScreen(),
      );
    });
  }
}
