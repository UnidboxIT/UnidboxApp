import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/app_screen.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/repository/provider/outlet_return_provider.dart';
import 'views/global_provider_observe.dart';
import 'views/screens/auth/repository/auth_state_notifier.dart';
import 'views/screens/notification_service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationController.initializeLocalNotifications();
  final sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    ProviderScope(
      //that is global provider
      observers: [globalProviderObserver],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const AppScreen(),
    ),
  );
}

@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  superPrint('Received notification Android: ${data['__json']}');
  superPrint('Received notification: ${data['message']}');
  globalProviderObserver.container!
      .read(myRequestStateNotifierProvider.notifier)
      .getAllMyRequest();
  globalProviderObserver.container!
      .read(otherRequestStateNotifierProvider.notifier)
      .getAllOtherRequest();
  globalProviderObserver.container!
      .read(outletReturnStateNotifier.notifier)
      .getAlloutletReturn();

  if (Platform.isAndroid) {
    Map<String, dynamic> jsonMap = jsonDecode(data['__json']);
    NotificationController.displayNotificationRationale(
      "Notification",
      jsonMap['message'],
    );
  }
}
