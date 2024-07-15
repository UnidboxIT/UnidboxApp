import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  static ReceivedAction? initialAction;
  static Future<void> initializeLocalNotifications(
      onActionReceivedMethod) async {
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

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        print("Notification Action Received 111 : ${receivedAction.body}");
        print(
            "Notification Action Received  222: ${receivedAction.channelKey}");
        onActionReceivedMethod(receivedAction);
      },
    );
  }

  static Future<bool> displayNotificationRationale(
      String title, String body) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'alerts',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.BigPicture,
        // payload: {'notificationId': '1234567890'},
      ),
    );
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}
