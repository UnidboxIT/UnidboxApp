import 'package:pushy_flutter/pushy_flutter.dart';

import '../../../utils/commons/super_print.dart';

String pushyToken = "";

Future pushyRegister(backgroundNotificationListener) async {
  try {
    // Register the user for push notifications
    Pushy.listen();
    Pushy.setNotificationListener(backgroundNotificationListener);
    pushyToken = await Pushy.register();
    superPrint(pushyToken);
    // Print token to console/logcat
  } catch (error) {
    // Display an alert with the error message
    superPrint(error);
  }
}
