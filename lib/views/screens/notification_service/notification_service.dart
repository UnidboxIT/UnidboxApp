import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  static ReceivedAction? initialAction;
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        'resource://drawable/app_icon',
        [
          NotificationChannel(
            channelKey: 'alerts',
            channelName: 'Notification Alerts',
            channelDescription: 'Notification alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
          )
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  static Future<bool> displayNotificationRationale(
      String message, String user) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'alerts',
        title: message,
        body: user,
        notificationLayout: NotificationLayout.BigPicture,
        // payload: {'notificationId': '1234567890'},
      ),
    );
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}
