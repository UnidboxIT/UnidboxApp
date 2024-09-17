import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:unidbox_app/views/screens/auth/presentation/auth_login_screen.dart';
import 'package:unidbox_app/main_screen.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'main.dart';
import 'utils/commons/super_print.dart';
import 'views/screens/internet_connection/provider/internet_provider.dart';
import 'views/screens/internet_connection/state/connection_status.dart';
import 'views/screens/notification_service/pushy_noti_service.dart';
import 'views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';

final shorebirdCodePush = ShorebirdCodePush();

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
    setState(() {
      shorebirdCodePush
          .currentPatchNumber()
          .then((value) => _checkForUpdates());
    });
  }

  Future<void> _checkForUpdates() async {
    // Check whether a patch is available to install.
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();
    await shorebirdCodePush.downloadUpdateIfAvailable();
    await Future.delayed(const Duration(milliseconds: 500));
    superPrint(isUpdateAvailable);
    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      // alertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(currentRouteProvider.notifier).state = '/';
    });
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
