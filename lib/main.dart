import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/app_screen.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'views/screens/auth/repository/auth_state_notifier.dart';
import 'views/screens/notification_service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initializeLocalNotifications();
  final sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const AppScreen(),
    ),
  );
}

@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  // Print notification payload data
  superPrint('Received notification: ${data['__json']}');
  superPrint('Received notification: ${data['message']}');
  Map<String, dynamic> jsonMap = jsonDecode(data['__json']);
  NotificationController.displayNotificationRationale(
    jsonMap['message'],
    jsonMap['user'],
  );
  // ReceivedNotification noti =
  //     ReceivedNotification.fromJson(jsonDecode(data['message']));
}
