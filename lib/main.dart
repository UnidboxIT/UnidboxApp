import 'dart:convert';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unidbox_app/app_screen.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/presentation/other_request_detail_screen.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_return/repository/provider/outlet_return_provider.dart';
import 'package:unidbox_app/views/screens/system_navigation/home_navigation.dart';
import 'views/global_provider_observe.dart';
import 'views/screens/auth/repository/auth_state_notifier.dart';
import 'views/screens/notification_service/notification_service.dart';
import 'views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import 'views/user_warehouse/provider/user_warehouse_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationController.initializeLocalNotifications(
    onActionReceivedMethod,
  );
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
      .read(userWarehouseStateNotifierProvider.notifier)
      .getUserWarehouse();
  globalProviderObserver.container!
      .read(warehouseStateNotifierProvider.notifier)
      .getAllWarehouse();
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

@pragma('vm:entry-point')
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  debugPrint("Notification Action Received : $receivedAction");
  final currentRoute = globalProviderObserver.container!
      .read(currentRouteProvider.notifier)
      .state;
  if (currentRoute != '/outletRequest') {
    if (receivedAction.body!.contains("updated") ||
        receivedAction.body!.contains("request")) {
      Navigator.push(
        homeNavRouteState.currentState!.context,
        MaterialPageRoute(
            builder: (builder) => const OtherRequestDetailScreen()),
      );
    }
  }
}
