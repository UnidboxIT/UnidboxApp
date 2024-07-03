import 'package:pushy_flutter/pushy_flutter.dart';

import '../../../utils/commons/super_print.dart';

String pushyToken = "";

Future pushyRegister(backgroundNotificationListener) async {
  Pushy.listen();
  Pushy.toggleInAppBanner(true);
  try {
    // Register the user for push notifications

    Pushy.setNotificationListener(backgroundNotificationListener);
    pushyToken = await Pushy.register();
    superPrint(pushyToken);
    Pushy.clearBadge();
  } catch (error) {
    // Display an alert with the error message
    superPrint(error);
  }
}
