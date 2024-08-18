import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import '../../../utils/commons/super_print.dart';
import '../../global_provider_observe.dart';
import '../internal_transfer/my_request/presentation/my_requests_detail_screen.dart';
import '../internal_transfer/my_return/presentation/my_return_screen.dart';
import '../internal_transfer/outlet_request/presentation/other_request_detail_screen.dart';
import '../internal_transfer/outlet_return/presentation/outlet_return_screen.dart';
import '../system_navigation/home_navigation.dart';
import '../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';

String pushyToken = "";

Future pushyRegister(backgroundNotificationListener) async {
  Pushy.listen();
  Pushy.toggleInAppBanner(true);
  Pushy.setNotificationIcon('ic_launcher');
  try {
    // Register the user for push notifications
    Pushy.setNotificationListener(backgroundNotificationListener);
    pushyToken = await Pushy.register();
    superPrint(pushyToken);
    if (Platform.isIOS) {
      Pushy.setNotificationClickListener((Map<String, dynamic> data) {
        final currentIosRoute = globalProviderObserver.container!
            .read(currentRouteProvider.notifier)
            .state;
        print('Notification click: $data');
        superPrint(currentIosRoute != '/myRequest');
        superPrint(currentIosRoute);
        RegExp regExp = RegExp(r'\baccepted\b');
        RegExp returnRegExp = RegExp(r'\breturned\b');
        if (currentIosRoute != '/outletRequest' &&
                data['message'].contains("updated") ||
            data['message'].contains("request")) {
          Navigator.push(
            homeNavRouteState.currentState!.context,
            MaterialPageRoute(
                builder: (builder) => const OtherRequestDetailScreen()),
          );
        } else if (currentIosRoute != '/myRequest' &&
                regExp.hasMatch(data['message']) ||
            data['message'].contains("packed") ||
            data['message'].contains("issued")) {
          if (regExp.hasMatch(data['message'])) {
            selectedFilterIndex = 1;
            Navigator.of(
              homeNavRouteState.currentState!.context,
            ).push(MaterialPageRoute(
                builder: (context) => const MyRequestsDetailScreen(
                      isStockRequest: false,
                    )));
          } else if (data['message'].contains("packed")) {
            selectedFilterIndex = 2;
            Navigator.of(
              homeNavRouteState.currentState!.context,
            ).push(MaterialPageRoute(
                builder: (context) => const MyRequestsDetailScreen(
                      isStockRequest: false,
                    )));
          } else {
            selectedFilterIndex = 4;
            Navigator.of(
              homeNavRouteState.currentState!.context,
            ).push(MaterialPageRoute(
                builder: (context) => const MyRequestsDetailScreen(
                      isStockRequest: false,
                    )));
          }
        } else if (currentIosRoute != '/myReturn' &&
            data['message'].contains("return_accepted")) {
          Navigator.of(
            homeNavRouteState.currentState!.context,
          ).push(
              MaterialPageRoute(builder: (context) => const MyReturnScreen()));
        } else if (currentIosRoute != '/outletReturn' &&
            returnRegExp.hasMatch(data['message'])) {
          Navigator.of(
            homeNavRouteState.currentState!.context,
          ).push(MaterialPageRoute(
              builder: (context) => const OutletReturnScreen()));
        }
      });
    }
    Pushy.clearBadge();
  } catch (error) {
    // Display an alert with the error message
    superPrint(error);
  }
}
